import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basi2/binds.dart';
import 'package:getx_basi2/signup.dart';
import 'home.dart';
import 'login.dart';
         //fafffffffffff
void main() {
  AllBinds().dependencies();
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     return const GetMaterialApp(
       home:  SignupScreeen(),
     );
   }
 }
