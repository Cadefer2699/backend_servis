

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/user.dart';

class ProfileController extends GetxController {
  var user = User.fromJson(GetStorage().read('user') ?? {}).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetStorage.init();
  }

  // void main() async {
  //   await GetStorage.init();
  //   runApp(const MyApp());
  // }


  void signOut() {
    //elimina el user guardado
    GetStorage().remove('user');
    //redirige al login
    Get.offNamedUntil('/login', (route) => false);
  }

  void goToProfileEdit() {
    Get.toNamed('/profile/edit');
  }


}