import 'package:flutter/material.dart';
import 'package:hcmobile/screen/component/bottomAppBar.dart';

class PainManagement extends StatefulWidget {
  const PainManagement({super.key});

  @override
  State<PainManagement> createState() => _PainManagementState();
}

class _PainManagementState extends State<PainManagement> {
  String? selectedRadioValue = 'non'; // Valeur par défaut pour les radios
  String? selectedRadioValuePro;
  String? selectedDropdownValue; // Valeur pour le Dropdown
  double _painLevel = 0;

  Color getPainIconColor(double painLevel) {
    if (painLevel >= 0 && painLevel <= 4) {
      return Colors.green; // Douleur faible
    } else if (painLevel >= 5 && painLevel <= 7) {
      return const Color.fromARGB(255, 137, 123, 1); // Douleur modérée
    } else {
      return Colors.red; // Douleur élevée
    }
  }

  IconData getPainMood(double painLevel) {
    if (painLevel >= 0 && painLevel <= 6) {
      return Icons.mood; // Douleur faible
    } else {
      return Icons.mood_bad_outlined; // Douleur élevée
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        foregroundColor: Colors.white,
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
          // Header avec l'image et le texte
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 13, 110, 253), // Couleur de fond bleue
              image: DecorationImage(
                image: AssetImage('assets/douleurs.png'),
                alignment: Alignment.centerRight, // Image à droite
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SUIVEZ L\'EVOLUTION DE VOS DOULEURS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Décrivez ce que vous ressentez...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          getPainMood(_painLevel),
                          color: getPainIconColor(_painLevel),
                          size: 100,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Quel est le niveau de votre douleur ?',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Slider(
                      value: _painLevel,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      activeColor: Color.fromARGB(255, 13, 110, 253),
                      inactiveColor: Color.fromARGB(255, 124, 171, 242),
                      label: _painLevel.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _painLevel = value;
                        });
                      },
                    ),
                    Center(
                      child: Text(
                        '${_painLevel.toInt()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description de la douleur',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Espace entre le titre et le champ texte
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // Fond blanc pour le champ texte
                            borderRadius:
                                BorderRadius.circular(8), // Coins arrondis
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.1), // Ombre légère
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: TextField(
                            maxLines: 4, // Permet d'agrandir le champ de texte
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // Texte en noir
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: InputBorder
                                  .none, // Supprimer les bordures par défaut
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Prenez-vous un médicament pour cette douleur ?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: Color.fromARGB(255, 13, 110, 253),
                              value: 'oui',
                              groupValue: selectedRadioValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue = value;
                                });
                              },
                            ),
                            Text('OUI')
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: Color.fromARGB(255, 13, 110, 253),
                              value: 'non',
                              groupValue: selectedRadioValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValue = value;
                                });
                              },
                            ),
                            Text('NON')
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Visibility(
                          visible: (selectedRadioValue == 'oui'),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quel Médicament Vous Prenez ?',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Fond blanc pour la liste déroulante
                                  borderRadius: BorderRadius.circular(
                                      8), // Coins arrondis
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.1), // Ombre légère
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    border: InputBorder
                                        .none, // Supprimer les bordures par défaut
                                  ),
                                  hint: Text(
                                    'Choisir Médicament', // Hint Text
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.black), // Icône déroulante
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors
                                          .black), // Style des éléments sélectionnés
                                  items: [
                                    DropdownMenuItem(
                                      value: 'Paracétamol',
                                      child: Text('Paracétamol'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Ibuprofène',
                                      child: Text('Ibuprofène'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Aspirine',
                                      child: Text('Aspirine'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDropdownValue = value;
                                    });
                                  },
                                  value:
                                      selectedDropdownValue, // Corrected value binding
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Avez vous vu un professionnel?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: Color.fromARGB(255, 13, 110, 253),
                              value: 'oui',
                              groupValue: selectedRadioValuePro,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValuePro = value;
                                });
                              },
                            ),
                            Text('OUI')
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              activeColor: Color.fromARGB(255, 13, 110, 253),
                              value: 'non',
                              groupValue: selectedRadioValuePro,
                              onChanged: (value) {
                                setState(() {
                                  selectedRadioValuePro = value;
                                });
                              },
                            ),
                            Text('NON')
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                         
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color.fromARGB(
                                    255, 13, 110, 253), // Couleur de fond bleue
                                textStyle: TextStyle(color: Colors.white),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), 
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

                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Colors.black,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                             
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), 
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
