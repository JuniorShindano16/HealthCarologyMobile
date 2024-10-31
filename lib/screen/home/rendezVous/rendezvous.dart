import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:icons_plus/icons_plus.dart';

class AppointmentList extends StatefulWidget {
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  final Color primaryColor = Color.fromARGB(255, 13, 110, 253);
  final UserController userController = Get.put(UserController());

  final List<String> tabs = [
    "Consultations",
    "Visites",
  ];
  int selectedIndex = 0;
  List<Map<String, dynamic>> consultations = [
    {
      'hospital': 'Clinique Ngaliema',
      'autre2': '25%',
      'autre1': '25%',
      'Tension': '125',
      'Température': '36°C',
      'service': 'CPN',
      'departement': 'Maternité',
      'issus': 'RAS.',
      'medecin': 'Aris Kandolo',
      'Ref': '586458',
      'Date': '16/06/2024',
    },

    {
      'hospital': 'Clinique Ngaliema',
      'autre2': '25%',
      'autre1': '25%',
      'Tension': '125',
      'Température': '36°C',
      'service': 'CPN',
      'departement': 'Maternité',
      'issus': 'RAS.',
      'medecin': 'Aris Kandolo',
      'Ref': '586458',
      'Date': '16/06/2024',
    },

    // Ajoutez d'autres consultations ici
  ];

  // Données des visites futures
  final List<Map<String, dynamic>> upComings = [
    {
      'doctorName': 'Dr. Ananya Patel',
      'specialization': 'Generaliste',
      'date': 'Monday, Sep 12',
      'time': '10:00 - 10:30 AM',
      'image': 'assets/dochomme1.png',
    },
    {
      'doctorName': 'Dr. Floyd Miles',
      'specialization': 'Dentiste',
      'date': 'Friday, Sep 30',
      'time': '10:30 - 11:00 AM',
      'image': 'assets/dochomme2.png',
    },
  ];

  // Données des visites annulées

  @override
  Widget build(BuildContext context) {
    // Liste des contenus par onglet
    List<Widget> tabContents = [
      // Consultation
      buildConsultationList(consultations),
      // Visites
      buildList(upComings),
    ];
    UserModel? user = userController.getUserModel();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              child: Center(
                child: Text(
                  "${user!.name!.substring(0, 1)}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text("Dossier",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 242, 241, 241),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        ? primaryColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? primaryColor
                                        : Colors.black,
                                    fontWeight: selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          if (index < tabs.length - 1)
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3)
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(child: tabContents[selectedIndex]), // Contenu des onglets
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        child: Icon(Icons.add),
        shape: CircleBorder(),
        onPressed: () {},
      ),

          );
  }

  Widget buildList(List<Map<String, dynamic>> appointments) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        var appointment = appointments[index];
        return Column(
          children: [
            buildAppointmentCard(
              doctorName: appointment['doctorName'],
              specialization: appointment['specialization'],
              date: appointment['date'],
              time: appointment['time'],
              image: appointment['image'],
              onCancel: () {},
              onReschedule: () {},
            ),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }

  // Fonction pour construire une carte de rendez-vous
  Widget buildAppointmentCard({
    required String doctorName,
    required String specialization,
    required String date,
    required String time,
    required String image,
    required VoidCallback onCancel,
    required VoidCallback onReschedule,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Détails du docteur
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(image),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        specialization,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Détails de la date et de l'heure
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      size: 16, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(date),
                  Spacer(),
                  Icon(Icons.access_time_outlined,
                      size: 16, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(time),
                ],
              ),
              SizedBox(height: 16),
              // Boutons Cancel et Reschedule
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancel,
                      child: Text('Annuler'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onReschedule,
                      child: Text('Reprogrammer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//card for consultations
Widget buildConsultationCard({
  required String hospital,
  String? autre1,
  String? autre2,
  String? date,
  String? issus,
  required String medecin,
  String? temperature,
  String? tension,
  String? service,
  String? department,
  String? ref,
}) {
  return Container(
    decoration: BoxDecoration(
        // border: Border.all(
        //   color: Colors.grey,
        // ),
        ),
    padding: EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hospital,
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 110, 253),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Dr $medecin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 12,
                // ),
                Text(
                  '  ${department!}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('  ${service}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('  Issue : ${issus!}'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ref : ${ref!}'),
                Text('Date : ${date}'),
              ],
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          child: Row(
            children: [
              Row(
                children: [
                  buildMeasurementWidget('T', temperature!,
                      backgroundColor: Color.fromARGB(255, 13, 110, 253)),
                  SizedBox(
                    width: 10,
                  ),
                  buildMeasurementWidget('V', autre1!),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  buildMeasurementWidget('S', tension!),
                  SizedBox(
                    width: 10,
                  ),
                  buildMeasurementWidget('R', autre2!,
                      backgroundColor: Color.fromARGB(255, 13, 110, 253)),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Text(
                    'Voir plus',
                    style: TextStyle(color: Color.fromARGB(255, 13, 110, 253)),
                  ),
                  Icon(Icons.chevron_right_outlined,
                      color: Color.fromARGB(255, 13, 110, 253)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget buildInfoCard(
    IconData icon, Color iconColor, String title, String subtitle) {
  return Container(
    width: 60,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color:
          const Color.fromARGB(255, 24, 113, 247), // Fond clair pour la carte
      borderRadius: BorderRadius.circular(15), // Bords arrondis
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
            child: Icon(
              icon,
              size: 15,
              color: iconColor,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

Widget buildMeasurementWidget(String label, String value,
    {Color backgroundColor = Colors.transparent}) {
  return Material(
    elevation: 4, // Vous pouvez ajuster l'élévation ici
    shape: CircleBorder(), // Définit la forme comme un cercle
    child: Container(
      width: 35,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 8,
                color:
                    backgroundColor == Colors.transparent ? null : Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 5,
                color:
                    backgroundColor == Colors.transparent ? null : Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildConsultationList(List<Map<String, dynamic>> consultations) {
  return ListView.builder(
    itemCount: consultations.length,
    itemBuilder: (context, index) {
      var consultation = consultations[index];
      return Column(
        children: [
          buildConsultationCard(
            hospital: consultation['hospital'] ?? 'Non spécifié',
            medecin: consultation['medecin'] ?? 'Non spécifié',
            autre1: consultation['autre1'],
            autre2: consultation['autre2'],
            date: consultation['Date'],
            department: consultation['departement'],
            issus: consultation['issus'],
            ref: consultation['Ref'],
            service: consultation['service'],
            temperature: consultation['Température'],
            tension: consultation['Tension'],
          ),

          SizedBox(height: 10), // Espacement entre les cartes
        ],
      );
    },
  );
}
