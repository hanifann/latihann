import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/color/controller/color_controller.dart';

class ColorScreen extends StatelessWidget {

  final colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=>
        colorController.isLoading.isTrue ?
        Center(
          child: CircularProgressIndicator(),
        ) :
        colorController.error.isEmpty ?
        Center(child: Text(colorController.color.value.data!.name!))
        : Text(colorController.error.value)
      ),
    );
  }
}