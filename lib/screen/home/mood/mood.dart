import 'package:flutter/material.dart';
import 'package:hcmobile/screen/component/bottomAppBar.dart';
import 'package:hcmobile/screen/home/mood/evolution.dart';


class Mood extends StatefulWidget {
  const Mood({super.key});

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  // Variable pour stocker l'humeur sélectionnée
  String? selectedMood;

  String emotionalDescription = ''; // Stocke la description émotionnelle

  // Variable pour stocker les soumissions (humeurs et descriptions)
  List<Map<String, dynamic>> moodEntries = [];

  // Map pour les humeurs et leurs scores respectifs
  final Map<String, int> moodScores = {
    'Heureux': 9,
    'Calme': 8,
    'Anxieux': 5,
    'Triste': 3,
    'Fatigué': 4,
    'Seul': 2,
    'Energetic': 7,
    'Deprimé': 1,
    'En colère': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Bottomngnavbarre()));
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              width: 20,
            ),
            Text(
              'Gestion Douleurs',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Section supérieure avec texte et image
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 13, 110, 253),
              image: DecorationImage(
                image: AssetImage('assets/depressed.png'),
                alignment: Alignment.centerRight,
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PARTAGEZ CE QUE VOUS RESSENTEZ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Permettez-nous d\'en savoir plus sur vous...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Section sentiments organisée en grille
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        containerFeelings(
                            'icoHappy.png', 'Heureux', Colors.yellow),
                        containerFeelings(
                            'icoCalme.png', 'Calme', Colors.yellow),
                        containerFeelings(
                            'icoAnxious.png', 'Anxieux', Colors.green),
                        containerFeelings(
                            'icoSad.png', 'Triste', Colors.greenAccent),
                        containerFeelings(
                            'icoBored.png', 'Fatigué', Colors.orange),
                        containerFeelings(
                            'icoLonely.png', 'Seul', Colors.yellow),
                        containerFeelings(
                            'icoExcited.png', 'Energetic', Colors.yellow),
                        containerFeelings(
                            'icoDepressed.png', 'Deprimé', Colors.greenAccent),
                        containerFeelings(
                            'icoAngry.png', 'En colère', Colors.red),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Text(
                      'Descrivez Votre état emotionnel',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: (value) {
                          emotionalDescription = value;
                        },
                        maxLines: 4,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (selectedMood != null &&
                              emotionalDescription.isNotEmpty) {
                            // Ajoute l'entrée à la liste
                            setState(() {
                              moodEntries.add({
                                'mood': selectedMood,
                                'description': emotionalDescription,
                                'score': moodScores[selectedMood],
                              });
                            });
                            print(
                                'Soumission : $selectedMood, $emotionalDescription');
                          } else {
                            print(
                                'Veuillez sélectionner une humeur et entrer une description.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 13, 110, 253),
                          textStyle: TextStyle(color: Colors.white),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Soumettre',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Redirige vers la page d'évolution avec les données
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EvolutionPage ()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Voir Évolution',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fonction containerFeelings améliorée
  Widget containerFeelings(String path, String title, Color color) {
    bool isSelected = selectedMood == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = title; // Met à jour l'humeur sélectionnée
          print('Humeur sélectionnée: $title avec score: ${moodScores[title]}');
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: isSelected
                  ? Color.fromARGB(255, 13, 110, 253)
                  : color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/$path'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
