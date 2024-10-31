import 'package:flutter/material.dart';

class AjouterPriseMedicament extends StatefulWidget {
  @override
  _AjouterPriseMedicamentState createState() => _AjouterPriseMedicamentState();
}

class _AjouterPriseMedicamentState extends State<AjouterPriseMedicament> {
  String? selectedRadioValuePro;
  String? selectedDropdownValue;
  String? selectedDropdownValueTemps;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Prise de Médicament',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
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
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: InputBorder.none,
                          ),
                          hint: Text(
                            'Choisir Médicament',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                          value: selectedDropdownValue,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: selectedDropdownValue != null,
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: double
                              .infinity, // Prend toute la largeur disponible
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.medical_services,
                                      color: Color.fromARGB(255, 13, 110, 253)),
                                  SizedBox(width: 5),
                                  Expanded(
                                    // Utilisation de Expanded pour éviter le débordement
                                    child: Text(
                                      "Posologie : 250mg, Trois fois/jour",
                                      style: TextStyle(color: Colors.black54),
                                      overflow: TextOverflow
                                          .ellipsis, // Couper le texte si trop long
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.medication,
                                      color: Color.fromARGB(255, 13, 110, 253)),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Quantité Initiale : 20 comprimées de 250 mg",
                                      style: TextStyle(color: Colors.black54),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.medical_information,
                                      color: Color.fromARGB(255, 13, 110, 253)),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Quantité Actuelle : 18 comprimées de 250 mg",
                                      style: TextStyle(color: Colors.black54),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.timer,
                                      color: Color.fromARGB(255, 13, 110, 253)),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      "Durée depuis première prise : 1 jour",
                                      style: TextStyle(color: Colors.black54),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Visibility(
                        visible: selectedDropdownValue != null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Période',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *
                                  0.9, // Utilisation de 50% de la largeur de l'écran
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
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: InputBorder.none,
                                ),
                                hint: Text(
                                  'Temps de la journée',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                items: [
                                  DropdownMenuItem(
                                    value: 'Matin',
                                    child: Text('Matin'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Midi',
                                    child: Text('Midi'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Soir',
                                    child: Text('Soir'),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    selectedDropdownValueTemps = value;
                                  });
                                },
                                value: selectedDropdownValueTemps,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dose',
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
                                        .white, // Fond blanc pour le champ texte
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
                                  child: TextField(
                                    maxLines:
                                        4, // Permet d'agrandir le champ de texte
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            'Comment Vous sentez vous à présent?',
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
                                  .white, // Fond blanc pour le champ texte
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
                              maxLines:
                                  4, // Permet d'agrandir le champ de texte
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
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AjouterPriseMedicament(),
                        ),
                      );
                    },
                    icon: Icon(Icons.save, color: Colors.white),
                    label: Text(
                      'Ajouter',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 13, 110, 253),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget buildTextField(String labelText, Function(String) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorColor: Color.fromARGB(255, 13, 110, 253),
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer une valeur';
          }
          return null;
        },
        onSaved: (value) {
          onSaved(value!);
        },
      ),
    );
  }
}
