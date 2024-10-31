import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hcmobile/screen/home/chat/discussions/chatContainer.dart';
import 'package:hcmobile/screen/home/homePage/accueil.dart';
import 'package:hcmobile/screen/home/paramettre/parametre.dart';
import 'package:hcmobile/screen/home/rendezVous/rendezvous.dart';

class Bottomngnavbarre extends StatefulWidget {
  const Bottomngnavbarre({super.key});

  @override
  State<Bottomngnavbarre> createState() => _BottomngnavbarreState();
}

class _BottomngnavbarreState extends State<Bottomngnavbarre> {
  int index = 0;
  List<Widget> sreensList = [
    Home(),
    Chatcontainer(),
    AppointmentList(),
    Parametre(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.01,
            ),
            child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black.withOpacity(0.7),
              activeColor: Colors.white,
              tabBackgroundColor: Color.fromARGB(255, 13, 110, 253),
              tabBorderRadius: 12,
              gap: 8,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              onTabChange: (index) {
                setState(() {
                  this.index = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconSize: 24,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GButton(
                  icon: Icons.chat_outlined,
                  text: 'Messages',
                  iconSize: 24,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GButton(
                  icon: Icons.folder_outlined,
                  text: 'Dossier',
                  iconSize: 24,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Paramètres',
                  iconSize: 24,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: sreensList[index],
    );
  }
}
