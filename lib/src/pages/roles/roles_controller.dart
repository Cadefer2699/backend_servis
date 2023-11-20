

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rolusuario/src/models/user.dart';

class RolesController extends GetxController{

  User? user;
  GetStorage storage = GetStorage();
  Function? refreshh;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //obtener el usuario de sesion
    user = User.fromJson(storage.read('user'));

  }

}