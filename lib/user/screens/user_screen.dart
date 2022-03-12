import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/color/screens/color_screen.dart';
import 'package:latihan/user/controller/user_controller.dart';

class UserScreen extends StatefulWidget {

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserController userController = Get.put(UserController());

  TextEditingController nameEditingController = TextEditingController();

  TextEditingController jobEditingController = TextEditingController();

  String name = '';

  String job = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameEditingController,
              decoration: InputDecoration(
                hintText: 'Nama'
              ),
            ),
            TextField(
              controller: jobEditingController,
              decoration: InputDecoration(
                hintText: 'Job'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context, 
                  builder: (_){
                    return AlertDialog(
                      content: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                );
                await userController.createUser(
                  nameEditingController.text, 
                  jobEditingController.text
                ).then((_) => Get.to(()=> ColorScreen()));
              }, 
              child: Text('post')
            )
          ],
        ),
      )
    );
  }
}