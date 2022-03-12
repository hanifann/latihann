import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latihan/color/domain/models/color_model.dart';
import 'package:latihan/color/domain/repositories/color_repository.dart';

class ColorService implements ColorRepositoy {
  final Dio dio = Dio();

  @override
  Future<Either<String, Color>> getColor()  async {
    try {
      final response = await dio.getUri(
        Uri.https(
          "reqres.in", 
          "/api/unknown/2"
        )
      );
      if(response.statusCode == 200){
        return Right(colorFromJson(jsonEncode(response.data)));
      } else {
        throw response.statusMessage.toString();
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}