
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class allController extends GetxController{
 var   opacity=0.0.obs;
 opcity(double values){
   opacity.value=values;
 }

 RxBool switchChanger=false.obs;
 switcher(bool values){
   switchChanger.value=values;
   print("switch");
 }


 RxList<String> names=["Banana","Apple","Guava","Mango","Grapes","Dates","Orange",].obs;
 RxList indexss=[].obs;

 addToFav(String values){
   indexss.add(values);
 }
 removeToFav(String values){
   indexss.remove(values);
 }

 RxString imagepath = ''.obs;

 Future getImage()async{
   final ImagePicker _picker=ImagePicker();
   final image=await _picker.pickImage(source: ImageSource.gallery);

   if(image!=null){
 imagepath.value=image.path.toString();
   }else{
     print('error');
   }

 }



}

class loginController extends GetxController{
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
RxBool loding=false.obs;
void loginFunRepo()async{
  loding.value=true;
 try{
   const String url="https://reqres.in/api/login";
   var response=await http.post(Uri.parse(url),
       body: {
         "email": emailController.value.text,
         "password": passwordController.value.text}
   );
   var data=jsonDecode(response.body);
   print(response.statusCode);
   print(data);
   if(response.statusCode==200){
     loding.value=false;
        Get.snackbar("Login", "Successfully Login Done",icon: Icon(Icons.add_alert_sharp));
   }else{
     loding.value=false;
     Get.snackbar("Login", "Failed Login${data['error']}",icon: Icon(Icons.error));

   }
 }catch(e){
   loding.value=false;
   Get.snackbar("Exception", e.toString());
 }
}


}



class signupController extends GetxController{
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  RxBool loding=false.obs;
  void signupFunRepo()async{
    loding.value=true;
    try{
      const String url="https://reqres.in/api/register";
      var response=await http.post(Uri.parse(url),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text}
      );
      var data=jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      if(response.statusCode==200){
        loding.value=false;
        Get.snackbar("Signup", "Successfully Signup Done",icon: Icon(Icons.add_alert_sharp));
      }else{
        loding.value=false;
        Get.snackbar("Signup", "Failed Signup ${data['error']}",icon: Icon(Icons.error));

      }
    }catch(e){
      loding.value=false;
      Get.snackbar("Exception", e.toString());
    }
  }


}