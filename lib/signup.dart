import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx.dart';
class SignupScreeen extends GetView<signupController> {
  const SignupScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(title: Text("Sign up")),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: TextFormField(
              controller: controller.emailController.value,
              decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0),
            child: TextFormField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
 controller.signupFunRepo();

          }, child: controller.loding.value?CircularProgressIndicator() :Text("Sign up"))
        ],),
      );
    });
  }
}