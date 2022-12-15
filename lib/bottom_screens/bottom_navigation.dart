import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_crew_project/bottom_screens/profile_screen.dart';

import 'home_screen.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int currentIndex = 0;
  final screens =<Widget> [

    const Home(),

    const Profile(),




  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body:


        IndexedStack(
          index: currentIndex,
          children: screens,
        ),

        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueAccent,
          currentIndex: currentIndex,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey,
          elevation: 50.0,
          selectedFontSize: 15.0,
          selectedLabelStyle:
          const TextStyle(
            color: Colors.white,
          ),
          unselectedFontSize: 10.0,
          unselectedLabelStyle:
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
            color: Colors.grey,
          ),
          items:  [

            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == 2 ? Icons.home_outlined :  Icons.home,
                color: Colors.orangeAccent,
                size: 30.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                currentIndex == 3 ? Icons.face : Icons.face_outlined,
                color: Colors.grey,
                size: 30.0,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}