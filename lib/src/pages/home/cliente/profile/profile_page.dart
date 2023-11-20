

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolusuario/src/pages/home/cliente/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {

  ProfileController conProfile = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end, //para ubicar en la parte de abajo
        children: [
          FloatingActionButton(
            onPressed: () => conProfile.goToProfileEdit(),
            child: Icon(Icons.edit),
            backgroundColor: Colors.lightGreenAccent,
          ),
          SizedBox(height: 15), //para darle margin
          FloatingActionButton(
            onPressed: () => conProfile.signOut(),
            child: Icon(Icons.power_settings_new),
            backgroundColor: Colors.red,
          ),
        ],
      ),
      body: Obx( () =>
        SafeArea(
          child: Column(
            children: [
              circleImageUser(),
              SizedBox(height: 20),
              userInfo(
                  'Nombre del usuario',
                  '${conProfile.user.value.name ?? ''} ${conProfile.user.value.lastname ?? ''}',
                  Icons.person
              ),
              userInfo(
                  'Email',
                  conProfile.user.value.email ?? '',
                  Icons.email
              ),
              userInfo(
                  'Telefono',
                  conProfile.user.value.phone ?? '',
                  Icons.phone
              ),
            ],
          ),
        ),
      )
    );
  }
  
  Widget userInfo(String title, String subtitle, IconData iconData) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
      ),
    ); 
  }

  Widget circleImageUser(){
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 200,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/img/user_profile_2.png',
                image: conProfile.user.value.image ?? 'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'
            ),
          ),
        ),
      ),
    );
  }

}
