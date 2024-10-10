import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WebController extends GetxController {
  Rx<bool> isLoading = Rx<bool>(false);
}