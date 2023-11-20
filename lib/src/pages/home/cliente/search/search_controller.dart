

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  void openDrawer(){
    key.currentState?.openDrawer();
  }

  void openSeleccionarRol(){
    Get.toNamed('/roles');
  }

}