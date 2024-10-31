import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:hcmobile/screen/home/VitalsSignes/viatlsSignsNew.dart';
import 'package:hcmobile/screen/home/VitalsSignes/vitalsSignesView.dart';
import 'package:hcmobile/screen/home/mood/mood.dart';
import 'package:hcmobile/screen/home/pain/pain.dart';
import 'package:hcmobile/screen/home/pharmacy/homePharma.dart';

class HeaderUi extends StatefulWidget {
  const HeaderUi({super.key});

  @override
  State<HeaderUi> createState() => _HeaderUiState();
}

class _HeaderUiState extends State<HeaderUi> {
  final UserController userController = Get.put(UserController());
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Widget> containerList = [
      InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Viatlssignsnew()));
          },
          child: containerBuilder("assets/meniSigne.png", "Singes vitaux")),
      InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Pharmaaccueil()));
          },
          child: containerBuilder("assets/menuPharma.png", "Pharmacie")),
      InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PainManagement()));
          },
          child:
              containerBuilder("assets/menuDouleur.png", "Gestion douleurs")),
      InkWell(
          onTap: () {},
          child: containerBuilder("assets/menuWallet.png", "Wallet")),
      InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Mood()));
          },
          child: containerBuilder("assets/menuHumeur.png", "Gestion humeur")),
    ];
    UserModel? user = userController.getUserModel();
    var token = userController.getToken();
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                child: Center(
                  child: Text(
                    "${user!.name!.substring(0, 1)}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 13, 110, 253),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showSeatSelectionPopup(context);
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      // child: TextField(enabled: true,
                      //   controller: controller,
                      //   decoration: InputDecoration(
                      //     hintText: 'Comment allez-vous aujourd\'hui?',
                      //     border: InputBorder.none,
                      //     hintStyle: TextStyle(
                      //       color: Colors.grey.shade400,
                      //     ),
                      //   ),
                      // ),

                      child: Center(
                        child: Text(
                          'Comment allez-vous aujourd\'hui?',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: containerList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: containerList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget containerBuilder(String path, String Speciality) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(5),
        child: ClipOval(
          child: Image.asset(
            path,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 5),
      Text(
        Speciality,
        style: TextStyle(fontSize: 10, color: Colors.black),
      ),
    ],
  );
}

// Fonction pour créer une colonne représentant une humeur
Widget buildMoodColumn(String label, String imagePath, Color backgroundColor) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          shape: BoxShape.circle,
          // color: backgroundColor,
          image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.contain,
            image: AssetImage(imagePath),
          ),
        ),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 12, // taille du texte
          fontWeight: FontWeight.bold, // pour rendre le texte gras
        ),
      )
    ],
  );
}

// Fonction principale pour afficher la boîte de dialogue
void showSeatSelectionPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Comment vous vous sentez ?'),
        content: SizedBox(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Choisissez votre ressenti'),
              SizedBox(height: 20),
              // Première ligne d'humeurs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMoodColumn(
                      'heureux', 'assets/icoHappy.png', Colors.yellow),
                  buildMoodColumn('Triste', 'assets/icoSad.png', Colors.yellow),
                  buildMoodColumn(
                      'Anxieux', 'assets/icoAnxious.png', Colors.greenAccent),
                ],
              ),
              // Deuxième ligne d'humeurs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMoodColumn(
                      'Energetic', 'assets/icoExcited.png', Colors.yellow),
                  buildMoodColumn(
                      'Fatigué', 'assets/icoBored.png', Colors.yellowAccent),
                  buildMoodColumn('Enervé', 'assets/icoAngry.png', Colors.red),
                ],
              ),
              // Troisième ligne d'humeurs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildMoodColumn(
                      'calme', 'assets/icoCalme.png', Colors.yellow),
                  buildMoodColumn(
                      'Deprimé', 'assets/icoDepressed.png', Colors.yellow),
                  buildMoodColumn(
                      'Seul', 'assets/icoLonely.png', Colors.greenAccent),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(
                  Color.fromARGB(255, 13, 110, 253)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Retour'),
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(
                  Color.fromARGB(255, 13, 110, 253)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Soumettre'),
          )
        ],
      );
    },
  );
}
