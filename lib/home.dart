import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx.dart';
 class HomePage extends GetView<allController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
print("object");

return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            Obx(() => Container(
              width: 200,
              height: 100,
              color: Colors.red.withOpacity(controller.opacity.value),
            ),),
            Obx(() => Slider(
              value: controller.opacity.value, onChanged: (value) {
              controller.opcity(value);
            },)),
        
        Obx(() => CupertinoSwitch(
          value: controller.switchChanger.value, onChanged: (value) {
          controller.switcher(value);
        
        },)),
        Obx(() => Column(children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: controller.imagepath.isNotEmpty?
            FileImage(File(controller.imagepath.toString())):null,
          ),

          InkWell(
              onTap: () {
                controller.getImage();
              },
              child: Text("get image")),
        ],),),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: controller.names.length,
              itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {
                if(controller.indexss.contains(controller.names[index].toString())){
                   controller.removeToFav(controller.names[index].toString());
                }else{
                  controller.addToFav(controller.names[index].toString());
                }
                  },
                  leading: const Icon(Icons.person),
                  title: Text("${controller.names[index]}"),
                  trailing: Obx(() => Icon(controller.indexss.contains(controller.names[index].toString()) ? Icons.favorite:Icons.favorite_border,color: Colors.red,),)
                ),
              );
            },

            ),



          ],
        ),
      ),
    );
  }
}

