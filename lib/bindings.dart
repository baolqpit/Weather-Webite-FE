import 'package:get/get.dart';

import 'controller/user_controller.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    print('Initial Controller');
    Get.put<UserController>(UserController());
    // Get.put<ImageController>(ImageController());
    // Get.put<AlbumController>(AlbumController());
    // TODO: implement dependencies
  }

}