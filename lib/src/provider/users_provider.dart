
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolusuario/src/api/environment.dart';
import 'package:rolusuario/src/models/user.dart';

import '../models/response_api.dart';

class UsersProvider extends GetConnect{

  String url = Environment.API_SERVIS + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post(
        '$url/create',
        user.toJson(),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    return response; 
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        '$url/login',
        {
          'email': email,
          'password': password
        },
        headers: {
          'Content-Type': 'application/json'
        }
    );

    if(response.body == null){
      Get.snackbar('Error', 'No se puede ejecutar la petición de login');
      return ResponseApi();
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;

  }



}
