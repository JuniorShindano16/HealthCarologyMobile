import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:hcmobile/screen/component/bottomAppBar.dart';
import 'package:hcmobile/screen/home/MonDossier/pages/conditions.dart';
import 'package:hcmobile/screen/home/MonDossier/pages/family.dart';
import 'package:hcmobile/screen/home/MonDossier/pages/identity.dart';
import 'package:icons_plus/icons_plus.dart';

class Homeprofil extends StatefulWidget {
  const Homeprofil({super.key});

  @override
  State<Homeprofil> createState() => _HomeprofilState();
}

class _HomeprofilState extends State<Homeprofil> {
  final UserController userController = Get.put(UserController());
  List<Map<String, dynamic>> emergencyContacts = [
    {'name': 'Marie Dupont', 'relation': 'Mère', 'phone': '06 12 34 56 78'},
    {'name': 'Jean Martin', 'relation': 'Frère', 'phone': '06 98 76 54 32'},
    {'name': 'Sophie Lambert', 'relation': 'Amie', 'phone': '06 23 45 67 89'},
  ];

  // Index of selected tab
  int selectedIndex = 0;
  final List<Map<String, dynamic>> allergies = [
    {
      'allergy': 'Pollen',
      'reaction': 'Éternuements, yeux larmoyants',
      'severity': 'Modérée',
    },
    {
      'allergy': 'Arachides',
      'reaction': 'Gonflement, éruptions cutanées',
      'severity': 'Élevée',
    },
    {
      'allergy': 'Antibiotiques (Pénicilline)',
      'reaction': 'Éruptions cutanées, choc anaphylactique',
      'severity': 'Critique',
    },
  ];

  // List of tabs
  final List<String> tabs = [
    "Traitements",
    "Allergies",
    "Contact",
  ];
  final List<Map<String, dynamic>> persons = [
    {
      'doctor': 'Ashley',
      'age': 47,
      'photo': 'assets/dochomme2.png',
      'date': "25 sep 2024"
    },
    {
      'doctor': 'Ashley',
      'age': 47,
      'photo': 'assets/dochomme2.png',
      'date': "25 sep 2024"
    },
    {
      'doctor': 'Ashley',
      'age': 47,
      'photo': 'assets/dochomme2.png',
      'date': "25 sep 2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var token = userController.getToken();
    List<Widget> tabContents = [
      // visitesSection(persons),
      dossierSection(),
      allergiesSection(allergies, () {}),
      emergencyContactsSection(emergencyContacts, () {
        print(token);
      }),
    ];
    UserModel? user = userController.getUserModel();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Bottomngnavbarre()));
                    },
                    child: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Profil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                EvaIcons.share_outline,
                size: 25,
              ),
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
                      "${user!.name} ${user.lastname} ${user.firstname}",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConditionsUi(),
                            ),
                          );
                        },
                        child: buidContainer(
                            "Conditions",
                            "Conditions de santé",
                            EvaIcons.shopping_bag_outline),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FamilyUi(),
                                ));
                          },
                          child: buidContainer(
                              "Famille", "Followers", EvaIcons.people)),
                      InkWell(
                        onTap: () {
                          //
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IdentityUi(),
                              ));
                        },
                        child: buidContainer("Identité", "A propos de vous",
                            EvaIcons.person_outline),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 241, 241)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Centrer la Row
                  children: [
                    SizedBox(width: 20),
                    ...List.generate(tabs.length, (index) {
                      return Row(
                        children: [
                          GestureDetector(
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
                          ),
                          if (index < tabs.length - 1) SizedBox(width: 45),
                        ],
                      );
                    }),
                  ],
                ),
              ),
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

//Emergency contact

Widget emergencyContactsSection(
    List<Map<String, dynamic>> contacts, VoidCallback onAddContact) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var contact in contacts)
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            'Relation: ${contact['relation']}\nTéléphone: ${contact['phone']}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: onAddContact,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Ajouter un contact',
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 13, 110, 253),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
          ),
        )
      ],
    ),
  );
}

//Allergies

Widget allergiesSection(
    List<Map<String, dynamic>> allergies, VoidCallback onAddAllergy) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pollen",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Éternuements, yeux larmoyants',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Antibiotiques (Pénicilline)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Éruptions cutanées, choc anaphylactique',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arachides",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Gonflement, éruptions cutanées, choc anaphylactique',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arachides",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Gonflement, éruptions cutanées, choc anaphylactique',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            ],
          ),
        ),
        TextButton.icon(
          onPressed: onAddAllergy,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Ajouter une allergie',
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
  );
}

//Dossier section
Widget dossierSection() {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dernier Diagnostque",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Icon(EvaIcons.thermometer)
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [Text("Maladie : "), Text("MALARIA")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Date : "), Text("20 juin 2024")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Prise en Charge : "), Text("Domicile")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Medecin : "), Text("Dr. Aristie KANDOLO")],
              )
            ],
          ),
        ),
        TextButton.icon(
          onPressed: () {
            // Action du bouton
          },
          icon: Icon(
            Icons.picture_as_pdf_outlined,
            color: Colors.white,
            size: 15,
          ),
          label: Text(
            'Téléchargez Toute l\'historique',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 13, 110, 253),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dernière Prescription",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Icon(Icons.edit_document)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [Text("Luther DP : "), Text("6 Comprimés/200 mg")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Arauclave: "), Text("12 Comprimés/500mg")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Tribexfort : "), Text("10 Comprimés/250mg")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Début Prise : "), Text("21 juin 2024")],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [Text("Fin Prise : "), Text("28 juin 2024")],
              )
            ],
          ),
        ),
        TextButton.icon(
          onPressed: () {
            // Action du bouton
          },
          icon: Icon(
            Icons.picture_as_pdf_outlined,
            color: Colors.white,
            size: 15,
          ),
          label: Text(
            'Téléchargez Toute l\'historique',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 13, 110, 253),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 5,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

//Function For Vsite Section
Widget visitesSection(List<Map<String, dynamic>> persons) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          // physics:
          //     NeverScrollableScrollPhysics(),
          itemCount: persons.length,
          itemBuilder: (context, index) {
            final person = persons[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(person['photo']),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person['doctor'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        " Date de la Visite : ${person['date']}",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Ajouter une visite',
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
  );
}

Widget buidContainer(String title, String description, IconData ico) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 70),
            Icon(ico, size: 12),
          ],
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          description,
          style: TextStyle(color: Colors.grey, fontSize: 8),
        ),
      ],
    ),
  );
}
/*** Container(
                child:
                    SingleChildScrollView(child: tabContents[selectedIndex])), */
