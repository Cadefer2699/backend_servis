import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rolusuario/src/models/user.dart';
import 'package:rolusuario/src/pages/home/cliente/home/home_page.dart';
import 'package:rolusuario/src/pages/home/trabajador/servicios_home/servicios_home_page.dart';
import 'package:rolusuario/src/pages/login/login_page.dart';
import 'package:rolusuario/src/pages/register/register_page.dart';
import 'package:rolusuario/src/pages/roles/roles_page.dart';
import 'package:rolusuario/src/utils/my_colors.dart';
import 'package:get/get.dart';

User myUser = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servis',
      initialRoute: myUser.id != null ?  '/home' : '/login',
      getPages: [
        GetPage(name: '/login', page: ()=> LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: ()=> HomePage()),
        GetPage(name: '/roles', page: ()=> RolesPage()),
        GetPage(name: '/servicios/home/trabajador', page: ()=> ServiciosHomePage())
      ],

      theme: ThemeData(
        primaryColor: MyColors.primaryColor
      ),
    );
  }


}
