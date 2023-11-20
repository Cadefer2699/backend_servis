
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rolusuario/src/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../api/environment.dart';

class HomeController extends GetxController{
  
  User user = User.fromJson(GetStorage().read('user') ?? {});

  var tabIndex = 0.obs;

  Socket socket = io('${Environment.API_SERVIS}chat', <String, dynamic> {
    'transports': ['websocket'],
    'autoConnect': false
  });

  HomeController(){
    print('USUARIO DE SESION: ${user.toJson()}');
    connectAndListen();
  }

  
  void connectAndListen() {
    if(user.id != null) {
      socket.connect();
      socket.onConnect((data) {
        print('USUARIO CONECTADO A SOCKET IO');
      });
    }
  }

  void currentIndex(int index) {
    tabIndex.value = index;
  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    socket.disconnect();
  }


}
