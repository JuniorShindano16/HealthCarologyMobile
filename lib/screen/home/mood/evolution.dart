import 'package:flutter/material.dart';
import 'package:hcmobile/screen/home/mood/mood.dart';

class EvolutionPage extends StatefulWidget {
  @override
  _EvolutionPageState createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage> {
  // Liste des options
  final List<String> options = ['Tous', 'Années', 'Mois', 'Semaine'];
  // Variable pour suivre l'option sélectionnée
  String selectedOption = 'Tous';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Mood()));
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              width: 20,
            ),
            Text(
              'Evolutions humeurs',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Options sous forme de chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: options.map((option) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(option),
                    selected: selectedOption == option,
                    selectedColor: Color.fromARGB(255, 13, 110, 253),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: selectedOption == option
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          // Contenu qui change selon l'option sélectionnée
          Expanded(
            child: Center(
              child: getContent(selectedOption),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction pour changer le contenu en fonction de l'option sélectionnée
  Widget getContent(String option) {
    switch (option) {
      case 'Semaine':
        return Text(
          'Semaine',
          style: TextStyle(fontSize: 24),
        );
      case 'Années':
        return Text(
          'Années',
          style: TextStyle(fontSize: 24),
        );
      case 'Mois':
        return Text(
          'Mois',
          style: TextStyle(fontSize: 24),
        );
      default:
        return Text(
          'Tous',
          style: TextStyle(fontSize: 24),
        );
    }
  }
}
