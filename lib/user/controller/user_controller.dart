import 'dart:developer';

import 'package:get/get.dart';
import 'package:latihan/user/domain/models/user_model.dart';
import 'package:latihan/user/domain/services/user_service.dart';

class UserController extends GetxController {
  final userService = UserService();


  var error = ''.obs;

  var isLoading = false.obs;

  User user = User();

  Future createUser(String name, String job) async {
    isLoading(true);
    final result = await userService.postUser(name, job);
    result.fold(
      (l) {
        error(l);
      }, 
      (r) {
        user = r;
      }
    );
    isLoading(false);
  }
}