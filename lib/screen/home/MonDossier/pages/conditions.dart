//

import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';

class ConditionsUi extends StatefulWidget {
  const ConditionsUi({super.key});

  @override
  State<ConditionsUi> createState() => _ConditionsUiState();
}

class _ConditionsUiState extends State<ConditionsUi> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "Ton Etat",
    "Héréditaires",
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> tabContents = [tonEtat(), conditionHereditaire()];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "VOS CONDITIONS DE SANTE",
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
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assets/dochomme1.png"),
                  fit: BoxFit.contain,
                ),
                color: Color.fromARGB(255, 242, 241, 241),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "Alex TSHIMANGA MAKABU",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 50),
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 241, 241)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(tabs.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedIndex == index
                                  ? Color.fromARGB(255, 13, 110, 253)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Color.fromARGB(255, 13, 110, 253)
                                : Colors.black,
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  child:
                      SingleChildScrollView(child: tabContents[selectedIndex])),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tonEtat() {
  return Column(
    children: [
      SizedBox(height: 10),
      // Première section : Poids, Taille, Groupe Sanguin, etc.
      Container(
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey.shade300),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildTableRow("Poids", "97 Kilos"),
            _buildTableRow("Taille", "186 cm"),
            _buildTableRow("Groupe Sanguin", "AB+"),
            _buildTableRow("Donneurs possibles", "AB+, O+, A+, B+"),
            _buildTableRow("Recepteur", "Universel"),
            _buildTableRow("Electrophorèse", "AA"),
          ],
        ),
      ),
      SizedBox(height: 10),
      // Deuxième section : Diabète, Hyper Tension, etc.
      Container(
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey.shade300),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildTableRow("Diabète", "Type 2"),
            _buildTableRow("Etat sérologique", "Séropositif"),
            _buildTableRow("Hyper Tension", "Positif"),
            _buildTableRow("Hypo Tension", "Négatif"),
            _buildTableRow("Anémie", "Négatif"),
            _buildTableRow("Cardiopathie", "Négatif"),
          ],
        ),
      ),
    ],
  );
}

TableRow _buildTableRow(String attribute, String value) {
  return TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          attribute,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
  );
}

Widget conditionHereditaire() {
  return Column(
    children: [
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey.shade300),
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
          },
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildTableRow("Diabète", "Père"),
            _buildTableRow("Hyper Tension", "Grand-mère"),
            _buildTableRow("Hypo Tension", "Oncle"),
            _buildTableRow("Anémie", "Frère"),
            _buildTableRow("Cardiopathie", "Mère"),
            _buildTableRow("Cancer", "Tante"),
            _buildTableRow("Alzheimer", "Grand-père"),
            _buildTableRow("Asthme", "Sœur"),
          ],
        ),
      ),
    ],
  );
}
