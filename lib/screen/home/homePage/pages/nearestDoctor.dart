import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Nearestdoctor extends StatefulWidget {
  const Nearestdoctor({super.key});

  @override
  State<Nearestdoctor> createState() => _NearestdoctorState();
}

class _NearestdoctorState extends State<Nearestdoctor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buidTopDoc("Dr. Amelia Emma", "Gynecologist", "4.9",
            "assets/dochomme1.png", "25/hr"),
        buidTopDoc("Dr Bosko Randon", "Podologist", "4.8",
            "assets/dochomme2.png", "30/hr"),
        buidTopDoc("Dr Bosko Randon", "Podologist", "4.8",
            "assets/dochomme2.png", "30/hr")
      ],
    );
  }
}

// Image(image: AssetImage('assets/dochomme1.png'), height: 100, width: 100,)

Widget buidTopDoc(
    String name, String specaiality, String score, String path, String price) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(path), fit: BoxFit.contain)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                specaiality,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Icon(
                    EvaIcons.star,
                    color: Colors.yellow,
                    size: 12,
                  ),
                  Text(
                    score,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15,
              ),
              Icon(EvaIcons.heart_outline, color: Color.fromARGB(255, 13, 110, 253)),
              SizedBox(
                height: 40,
              ),
              Text("\$$price",
                  style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 13, 110, 253))),
            ],
          )
        ],
      ),
    ),
  );
}
