
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolusuario/src/pages/home/cliente/home/home_controller.dart';
import 'package:rolusuario/src/pages/home/cliente/profile/profile_page.dart';
import 'package:rolusuario/src/pages/home/cliente/search/search_page.dart';

HomeController con = Get.put(HomeController());

class HomePage extends StatelessWidget {

  final List<Widget> pages = [
      SearchPage(),
      ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
          index: con.tabIndex.value,
          height: 55.0,
          items: <Widget>[
            Icon(Icons.search, size: 26, color: Colors.white),
            Icon(Icons.engineering_sharp, size: 26, color: Colors.white),
            Icon(Icons.chat, size: 26, color: Colors.white),
            Icon(Icons.person, size: 26, color: Colors.white),
          ],
          color: Color(0xFFFF9800),
          buttonBackgroundColor: Color(0xFFFF9800),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            con.tabIndex.value = tappedIndex;
          },
          letIndexChange: (index) => true,
        ),
      ),
      body: Obx(
            () => Container(
          child: Center(
            child: pages[con.tabIndex.value],
          ),
        ),
      ),
    );
  }
}
