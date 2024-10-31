import 'package:flutter/material.dart';

class Spalshthree extends StatefulWidget {
  const Spalshthree({super.key});

  @override
  State<Spalshthree> createState() => _SpalshthreeState();
}

class _SpalshthreeState extends State<Spalshthree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Bienvenue...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromARGB(255, 13, 110, 253)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/doctors.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                "Vous avez à votre disposition un personnel de qualité!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
