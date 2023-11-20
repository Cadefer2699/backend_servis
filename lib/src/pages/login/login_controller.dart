
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rolusuario/src/models/user.dart';

import '../../models/response_api.dart';
import '../../provider/users_provider.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  //dependencia de Get - nos ayuda para almacenar el inicio de sesión del usuario.
  GetStorage storage = GetStorage();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email.isNotEmpty && password.isNotEmpty){
      ResponseApi responseApi = await usersProvider.login(email, password);
      
      print('Response Api: ${responseApi.toJson()}'); 
      
      if(responseApi.success == true){
        //ALMACENANDO LA DATA EN SESION, EN DONDE UTILIZAMOS storage.write
        User user = User.fromJson(responseApi.data);
        //guarda la sesión storage en el dispotivo
        storage.write('user', user.toJson());
        Get.snackbar('Usuario Logeado', 'Inicio de sesión exitoso');

        //print('USUARIO LOGEADO: ${user.toJson()}');
        //validación para saber si el cliente tiene más de un usuario
        if((user.roles?.length ?? 0) > 1){
          Get.toNamed('/roles');
        } else{
          goToHomePage();
        }


      }
      else {
        Get.snackbar('Error de sesión', 'No se ha podido iniciar sesión');
      }
    }
    else {
      Get.snackbar('Completa los datos', 'Ingresa el email y el password');
    }
  }

  //metodo para enviar a la pagina home
  void goToHomePage(){
    Get.toNamed('/home');
  }

}