
import 'package:authentication_project/app_constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_color/app_color.dart';
import '../../controller/task_controller.dart';
class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  TaskController taskController =Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueShade900,
        automaticallyImplyLeading: false,
        title: const Text(AppConstant.addTask,style: TextStyle(color: AppColor.white),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5,),
          descriptionTextField(),
          const SizedBox(height: 10,),
          saveButton(),
        ],
      ),
    );
  }

  Widget descriptionTextField(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: TaskController.descriptionController,
        maxLines: 5,
        decoration:  InputDecoration(
            hintText: "Description",
            contentPadding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color:AppColor.grey)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.grey,
                )
            )
        ),
      ),
    );
  }

  Widget saveButton(){
    return SizedBox(width: 345,child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColor.blueShade900),onPressed: (){}, child: const Text("Save",style: TextStyle(color: AppColor.white,fontSize: 20),)));
  }
}
