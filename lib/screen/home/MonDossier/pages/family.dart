import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class FamilyUi extends StatefulWidget {
  const FamilyUi({super.key});

  @override
  State<FamilyUi> createState() => _FamilyUiState();
}

class _FamilyUiState extends State<FamilyUi> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "Vos enfants",
    "Vos parents",
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> persons = [
      // {
      //   'doctor': 'Ashley',
      //   'age': 47,
      //   'photo': 'assets/dochomme2.png',
      // },
      {'name': 'Kabod', 'age': 2, 'photo': 'assets/Kabod.jpg'},
      {'name': 'Marcus', 'age': 12, 'photo': 'assets/Marcus.jpg'},
      {'name': 'Faida', 'age': 12, 'photo': 'assets/Faida.jpg'},
      {'name': 'Francia', 'age': 12, 'photo': 'assets/Francia.jpg'},
      // Ajoute d'autres personnes ici avec leur photo
    ];
    void addNewChild(String name, String nationalNumber) {
      setState(() {
        // Ajout de l'enfant dans une structure de données, ici 'chatData' utilisé comme exemple
        // chatData[name] = {
        //   'name': name,
        //   'nationalNumber': nationalNumber,  // Le numéro national remplace 'number'
        //   'photo': 'assets/calme.png',       // Image par défaut
        //   'lastMessage': 'No messages yet',
        //   'status': 'Offline',
        //   'messages': [],
        // };
      });
    }

    List<Map<String, dynamic>> parents = [
      {
        'name': 'Alex',
        'age': '69',
        'photo': 'assets/papa.jpg',
        'status': 'Father'
      },
      {
        'name': 'Blandine',
        'age': 65,
        'photo': 'assets/meme.jpg',
        'status': 'Grandmother'
      },
      {
        'name': 'Audette',
        'age': 45,
        'photo': 'assets/maman.jpg',
        'status': 'Mother'
      },
      {
        'name': 'Charles',
        'age': 70,
        'photo': 'assets/pepe.jpg',
        'status': 'Grandfather'
      }
    ];

    List<Widget> tabContents = [
      buildPersonList(persons),
      buildParentList(parents)
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newName = '';
              String newNationalNumber = '';

              return AlertDialog(
                title: Text('Ajouter un enfant'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Nom de l\'enfant'),
                      onChanged: (value) {
                        newName = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Numéro National'),
                      keyboardType: TextInputType
                          .number, // Pour forcer l'entrée numérique
                      onChanged: (value) {
                        newNationalNumber = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('Annuler'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Ajouter'),
                    onPressed: () {
                      if (newName.isNotEmpty && newNationalNumber.isNotEmpty) {
                        // Appelle une méthode pour ajouter un nouvel enfant avec les informations fournies
                        addNewChild(newName, newNationalNumber);
                        Navigator.of(context)
                            .pop(); // Ferme la boîte de dialogue après l'ajout
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Famille",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
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
                          "LES PERSONNES QUE VOUS SUIVEZS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 242, 241, 241)),
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
    );
  }
}

Widget buildPersonList(List<Map<String, dynamic>> persons) {
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: persons.length,
              itemBuilder: (context, index) {
                final person = persons[index];

                final name = person['name'] ?? person['doctor'] ?? 'Inconnu';
                final age = person['age']?.toString() ?? 'Inconnu';
                final photo = person['photo'] ?? 'assets/default.png';

                return ListTile(
                  trailing: Icon(EvaIcons.info),
                  leading: InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photo),
                      radius: 30,
                    ),
                  ),
                  title: Text(name),
                  subtitle: Text("Âge : $age ans"),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildParentList(List<Map<String, dynamic>> parents) {
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: parents.length,
              itemBuilder: (context, index) {
                final parent = parents[index];

                final name = parent['name'] ?? 'Inconnu';
                final age = parent['age']?.toString() ?? 'Inconnu';
                final photo = parent['photo'] ?? 'assets/default.png';
                final status = parent['status'] ?? 'Status inconnu';

                return ListTile(
                  trailing: Icon(EvaIcons.info),
                  leading: InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photo),
                      radius: 30,
                    ),
                  ),
                  title: Text(name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Âge : $age ans"),
                      Text("Statut : $status"),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
