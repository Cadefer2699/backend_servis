
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rolusuario/src/models/user.dart';
import 'package:rolusuario/src/provider/users_provider.dart';

class RegisterController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  //CREO_UN_METODO_PARA_REGISTRAR_USUARIOS
  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    User user = User(
      email: email,
      name: name,
      lastname: lastname,
      phone: phone,
      password: password
    );
    Response response = await usersProvider.create(user);

    print('Response: ${response.body}');

  }

}