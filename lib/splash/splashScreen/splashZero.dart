import 'package:flutter/material.dart';

class Splashzero extends StatefulWidget {
  const Splashzero({super.key});

  @override
  State<Splashzero> createState() => _SplashzeroState();
}

class _SplashzeroState extends State<Splashzero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, top: 50),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Nous Suivons vos habitudes...",
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
                        image: AssetImage('assets/med.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                "Tout ce que vous ferez, sera enregistré et nous vous procurerons des conseils sur cette base!",
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
