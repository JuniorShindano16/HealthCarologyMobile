import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hcmobile/controllers/HomeController.dart';
import 'package:hcmobile/controllers/userController.dart';

class Setting {
  static Future<void> initUser() async {
    await GetStorage.init("Hcm");
    storage = GetStorage("Hcm");
    // storageIdentity = GetStorage("SawaidIdentity");
  }

  static late GetStorage storage;
  // static late GetStorage storageIdentity;
  static HomeController get Home_controller {
    try {
      return Get.find<HomeController>();
    } catch (e) {
      return Get.put(HomeController());
    }
  }

  static UserController get User_controller {
    try {
      return Get.find<UserController>();
    } catch (e) {
      return Get.put(UserController());
    }
  }
}
