

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickController extends GetxController{

  RxString imagePath = "".obs;
  final ImagePicker picker = ImagePicker();

  Future getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }



}