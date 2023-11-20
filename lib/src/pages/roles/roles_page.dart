import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RolesPage extends StatelessWidget {
  const RolesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff9800),
        title: Text('Selecciona un rol'),
        titleTextStyle: TextStyle(
          fontSize: 18,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logoCliente(),
            SizedBox(height: 20),
            _logoTrabajador(),
          ],
        ),
      )
    );
  }

  Widget _logoCliente(){
    return GestureDetector(
      onTap: (){
        Get.toNamed('/home');
      },
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            child: Image.asset(
              'assets/img/clientes.png',
              width: 230,
            ),
          ),
          Text(
              'Cliente',
              style: TextStyle(
                fontSize: 25, //tamaño
                color: Color(0xFF949B96),
                fontWeight: FontWeight.bold,
              ),
          )
        ],
      ),
    );
  }


  Widget _logoTrabajador(){
    return GestureDetector(
      onTap: () {
        Get.toNamed('/servicios/home/trabajador'); 
      },
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(bottom: 20.0), 
            child: Image.asset(
              'assets/img/trabajadores.png', 
              width: 230,
            ),
          ), 
          Text(
              'Trabajador',
            style: TextStyle(
              fontSize: 25, //tamaño
              color: Color(0xFF949B96),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ); 
  }

}
