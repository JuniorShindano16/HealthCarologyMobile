import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class IdentityUi extends StatefulWidget {
  const IdentityUi({super.key});

  @override
  State<IdentityUi> createState() => _IdentityUiState();
}

class _IdentityUiState extends State<IdentityUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Identité",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 13, 110, 253),
              ),
              child: const Icon(EvaIcons.share_outline,
                  size: 25, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 242, 241, 241),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assets/dochomme1.png"),
                  fit: BoxFit.contain,
                ),
                color: const Color.fromARGB(255, 242, 241, 241),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    'Patient',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Alex TSHIMANGA MAKABU",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "H-NID : 8H-M001-00001",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "PHONE : 827546236",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Age : 25 ans",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Adresse ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 13, 110, 253),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                EvaIcons.home_outline,
                                color: Color.fromARGB(255, 13, 110, 253),
                                size: 18,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 150,
                            child:
                                Text('Route Matadi N°9, Kinshasa/MontNgafula',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nationalité(s)',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 13, 110, 253),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                EvaIcons.flag,
                                color: Color.fromARGB(255, 13, 110, 253),
                                size: 18,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 150,
                            child: Text('-Congolaise\n-Canadienne',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lieu et date de Naissance',
                          style: TextStyle(
                              color: Color.fromARGB(255, 13, 110, 253),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.child_friendly_sharp,
                          color: Color.fromARGB(255, 13, 110, 253),
                          size: 18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Né(e) à Kinshasa',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                        Text('Le 16 juin 1999',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Etat Civil',
                          style: TextStyle(
                              color: Color.fromARGB(255, 13, 110, 253),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.wc_outlined,
                          color: Color.fromARGB(255, 13, 110, 253),
                          size: 18,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Célibataire',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
