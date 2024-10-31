// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class Pharmaaccueil extends StatefulWidget {
  const Pharmaaccueil({super.key});

  @override
  State<Pharmaaccueil> createState() => _PharmaaccueilState();
}

class _PharmaaccueilState extends State<Pharmaaccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          'Pharmacie',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade300,
                          blurStyle: BlurStyle.inner)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Importez Votre Prescription',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Text(
                        'Dites nous ce que vous voulez. On s\'occupe du reste...',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 89,
                          child: Text(
                            'Réduction de 25% sur les Produits',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.black,
                              elevation: 2,
                            ),
                            onPressed: () {},
                            child: Text(
                              'PRENDRE MAINTENANT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      columnMedecine('Modane 250 Mg', 'assets/modane.png'),
                      columnMedecine('Microgol 250 Mg', 'assets/microgol.png'),
                      columnMedecine('Movicol 250 Mg', 'assets/movicol.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      columnMedecine(
                          'Paracetamol 250 Mg', 'assets/micralax.png'),
                      columnMedecine('Modane 250 Mg', 'assets/modane.png'),
                      columnMedecine('Microgol 250 Mg', 'assets/microgol.png'),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Votre actuelle cure",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {},
                    child: Text("Vos cure Passées",
                        style: TextStyle(fontSize: 15, color: Colors.blue)),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Produits",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              "Modane",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              "Modane",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              "Modane",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantité Initialle",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "10 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "10 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "10 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantité Actuelle",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "7 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "7 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: Text(
                              "7 C/250mg",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AjouterPriseMedicament(),
                //   ),
                // );
              },
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Ajouter une prise',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget columnMedecine(String description, String path) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10)),
        child: Image(
          image: AssetImage(path),
          height: 70,
          width: 70,
          fit: BoxFit.contain,
        ),
      ),
      Text(
        description,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      )
    ],
  );
}
