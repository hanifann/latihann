import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latihan/user/domain/models/user_model.dart';
import 'package:latihan/user/domain/repositories/user_repository.dart';

class UserService implements UserRepository{
  final Dio dio = Dio();

  @override
  Future<Either<String, User>> postUser(String name, String job) async {
    try {
      final response = await dio.postUri(
        Uri.http(
          "reqres.in", 
          "/api/users"
        ),
        data: {
          "name": name,
          "job": job
        }
      );
      if(response.statusCode == 201){
        return Right(userFromJson(jsonEncode(response.data)));
      } else {
        throw response.statusMessage.toString();
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}