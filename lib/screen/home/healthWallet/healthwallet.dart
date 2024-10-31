import 'package:flutter/material.dart';

class Healthwallet extends StatefulWidget {
  const Healthwallet({super.key});

  @override
  State<Healthwallet> createState() => _HealthwalletState();
}

class _HealthwalletState extends State<Healthwallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("mood"),
      ),
    );
  }
}
