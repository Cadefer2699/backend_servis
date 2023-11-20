
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolusuario/src/pages/home/cliente/search/search_controller.dart' as MySearchController;

class SearchPage extends StatelessWidget {

  MySearchController.SearchController con = Get.put(MySearchController.SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Servis',
          style: TextStyle(
            fontSize: 30
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffff9800),
      ),
      drawer: _drawer(),

      body: Container(
        width: double.infinity,

      )
    );
  }
}



Widget _drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
                color: Color(0xFFFF9800)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nombre del usuario',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                  maxLines: 1,
                ),
                Text(
                  'email',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                  ),
                  maxLines: 1,
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(top: 10),
                  child: FadeInImage(
                    image: AssetImage('assets/img/no-image.png'),
                    fadeInDuration: Duration(milliseconds: 50),
                    placeholder: AssetImage('assets/img/no-image.png'),
                  ),
                )
              ],
            )
        ),
        ListTile(
          title: Text('Editar perfil'),
          trailing: Icon(Icons.edit_outlined),
        ),
        ListTile(
          title: Text('Servicios Adquiridos'),
          trailing: Icon(Icons.miscellaneous_services_sharp),
        ),
        ListTile(
          title: Text('Usuarios adquiridos'),
          trailing: Icon(Icons.miscellaneous_services_sharp),
        ),
        ListTile(
          title: Text('Seleccionar Rol'),
          trailing: Icon(Icons.person_outline),
          onTap: () {
            Get.toNamed('/roles');
          }
        ),
      ],
    ),
  );
}
