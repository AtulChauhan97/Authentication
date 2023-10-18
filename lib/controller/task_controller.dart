
import 'package:authentication_project/screens/task_screen/add_task.dart';
import 'package:authentication_project/screens/task_screen/all_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{

 static TextEditingController descriptionController = TextEditingController();

static void allTask(){
   Get.to(const AllTask());
   
 }

 static void addTask(){
  Get.to(const AddTask());
 }


}