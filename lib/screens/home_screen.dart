import 'dart:io';
import 'package:authentication_project/controller/home_controller.dart';
import 'package:authentication_project/controller/image_picker_controller.dart';
import 'package:authentication_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController homeController = Get.put(HomeController());
  LoginController loginController = Get.put(LoginController());
  ImagePickController imagePickController = Get.put(ImagePickController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawerFeature(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        leading: leadingStackProperty(),
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                homeController.logOutUser();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Welcome in home page",
            ),
          ),
          ElevatedButton(
              onPressed: () {
                imagePickController.getImage();
              },
              child: const Text("image"))
        ],
      ),
    );
  }

  Widget leadingStackProperty() {
    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        InkWell(
            onTap: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
            child: Obx(
              () => CircleAvatar(
                backgroundImage: imagePickController.imagePath.isNotEmpty
                    ? FileImage(File(imagePickController.imagePath.toString()))
                    : null,
              ),
            )),
        Positioned(
          top: 30,
          left: 25,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget drawerFeature() {
    return Drawer(
      width: 280,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           height: 200,
           width: 280,
           color: Colors.blue.shade900.withOpacity(1),
           child:  Padding(
             padding: const EdgeInsets.only(top: 60.0,left: 10),
             child: Row(
               children: [
                 ClipRRect(
                     borderRadius: BorderRadius.circular(35),
                     child: Obx(
                           () => Container(
                           height: 70,
                           width: 70,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(35),
                           ),
                           child: imagePickController.imagePath.isNotEmpty
                               ? Image.file(
                             File(imagePickController.imagePath.value
                                 .toString()),
                             fit: BoxFit.fitHeight,
                           )
                               : Icon(
                             Icons.person,
                             color: Colors.grey.shade200,
                           )),
                     )),
                 SizedBox(width: 20,),
                 const Text(
                   "Name",
                   style: TextStyle(color: Colors.white,fontSize: 18),
                 )
               ],
             ),
           ),
         ),
          const Divider(
            height: 2,
            thickness: 3,
          )

        ],
      ),
    );
  }
}
