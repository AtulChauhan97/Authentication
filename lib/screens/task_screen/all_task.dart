import 'package:authentication_project/app_color/app_color.dart';
import 'package:authentication_project/app_constant/app_constant.dart';
import 'package:authentication_project/controller/task_controller.dart';
import 'package:flutter/material.dart';

class AllTask extends StatefulWidget {
  const AllTask({super.key});

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawerFeature(),
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: const IconThemeData(color:AppColor.white),
        backgroundColor: AppColor.blueShade900,
        title: const Text(
          AppConstant.allTask,
          style: TextStyle(color: AppColor.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColor.blueShade900,
        onPressed: () {
          TaskController.addTask();
        },
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
    );
  }


 /* Widget leadingProperty() {
    return InkWell(
        onTap: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openDrawer();
            //open drawer, if drawer is closed
          }
        },
    );
  }*/

  Widget drawerFeature(){
    return const Drawer(
      width: 260,
    );
  }
}
