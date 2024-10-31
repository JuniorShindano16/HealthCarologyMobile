import 'dart:ui';

import 'package:custom_will_pop_scope/custom_will_pop_scope.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:hcmobile/screen/home/MonDossier/monDossier.dart';
import 'package:hcmobile/screen/home/VitalsSignes/vitalsSignesView.dart';
import 'package:hcmobile/screen/home/find/findSpeciality.dart';
import 'package:hcmobile/screen/home/find/template.dart';
import 'package:hcmobile/screen/home/homePage/pages/header.dart';
import 'package:hcmobile/screen/home/homePage/pages/nearestDoctor.dart';
import 'package:hcmobile/screen/home/mood/mood.dart';
import 'package:hcmobile/screen/home/notifications/notifications.dart';
import 'package:hcmobile/screen/home/pain/pain.dart';
import 'package:hcmobile/screen/home/rendezVous/rendezvous.dart';
import 'package:icons_plus/icons_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedFilter = 'Mois';

  Widget buildFilterButton(String label) {
    bool isSelected = selectedFilter == label;
    return TextButton(
        onPressed: () {
          setState(() {
            selectedFilter = label;
          });
        },
        style: TextButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.black : Color.fromARGB(232, 238, 221, 207),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ));
  }

  int currentWeek = 0;
  final UserController userController = Get.put(UserController());
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

  final List<List<Map<String, dynamic>>> availabilityWeeks = [
    [
      {'day': 'Mon', 'date': '16', 'available': true},
      {'day': 'Tue', 'date': '17', 'available': false},
      {'day': 'Wed', 'date': '18', 'available': true},
      {'day': 'Thu', 'date': '19', 'available': true},
      {'day': 'Fri', 'date': '20', 'available': false},
      {'day': 'Sat', 'date': '21', 'available': true},
      {'day': 'Sun', 'date': '22', 'available': true},
    ],
    [
      {'day': 'Mon', 'date': '23', 'available': true},
      {'day': 'Tue', 'date': '24', 'available': true},
      {'day': 'Wed', 'date': '25', 'available': false},
      {'day': 'Thu', 'date': '26', 'available': true},
      {'day': 'Fri', 'date': '27', 'available': true},
      {'day': 'Sat', 'date': '28', 'available': false},
      {'day': 'Sun', 'date': '29', 'available': true},
    ],
  ];
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

  String getCurrentMonthAndYear() {
    return currentWeek == 0 ? 'August 2024' : 'September 2024';
  }

  void previousWeek() {
    setState(() {
      if (currentWeek > 0) {
        currentWeek--;
      }
    });
  }

  void nextWeek() {
    setState(() {
      if (currentWeek < availabilityWeeks.length - 1) {
        currentWeek++;
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    UserModel? user = userController.getUserModel();
    var token = userController.getToken();

    return CustomWillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: buildCustomDrawer(context, user!),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!
                          .openDrawer(); // Ouvre le Drawer
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      // padding: EdgeInsets.all(10),
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
                          color: Color.fromARGB(255, 13, 110, 253)),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Bonjour ${user.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Findspeciality()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NotificationExamplePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 242, 241, 241),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderUi(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16, right: 16.0, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prise Médicament",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16.0, bottom: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF00C9FF),
                          Color.fromARGB(255, 13, 110, 253),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sous-cure",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "3 jrs",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Image.asset(
                            'assets/bakcala2.png', // Image des capsules
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Derniers signes vitaux",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Signesvitaux()));
                      },
                      child: Text("Voir Tout",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 13, 110, 253))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Appel de la fonction avec des icônes Flutter et des couleurs personnalisées
                    buildInfoCard(
                      EvaIcons.thermometer,
                      Colors.orange,
                      'Temp',
                      '36.3°C',
                    ),
                    buildInfoCard(
                        Icons.air, Colors.purple, 'Oxygène', '18 ppm'),
                    buildInfoCard(
                        Icons.favorite, Colors.red, 'Coeur', '18 bpm'),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dernière Consultation",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: buildConsultationCardAcc(
                  hospital: consultations.first['hospital'] ?? 'Non spécifié',
                  medecin: consultations.first['medecin'] ?? 'Non spécifié',
                  autre1: consultations.first['autre1'],
                  autre2: consultations.first['autre2'],
                  date: consultations.first['Date'],
                  department: consultations.first['departement'],
                  issus: consultations.first['issus'],
                  ref: consultations.first['Ref'],
                  service: consultations.first['service'],
                  temperature: consultations.first['Température'],
                  tension: consultations.first['Tension'],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//card for consultation

Widget buildConsultationCardAcc({
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
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
                      style:
                          TextStyle(color: Color.fromARGB(255, 13, 110, 253)),
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
          // Divider(
          //   color: Colors.grey,
          // ),
        ],
      ),
    ),
  );
}

Drawer buildCustomDrawer(BuildContext context, UserModel user) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // Header de la Drawer
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 13, 110, 253),
                ),
                child: Center(
                  child: Text(
                    "${user!.name!.substring(0, 1)}",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40), // Espacement entre l'icône et le texte
              // Nom de l'utilisateur
              Text(
                '${user.name} ${user.lastname} ${user.firstname}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Ma Santé',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        // Liste des options
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Homeprofil()));
          },
        ),
        ListTile(
          leading: Icon(Icons.people_alt_outlined),
          title: Text('Communauté'),
          onTap: () {
            // Action lors du tap sur l'élément
          },
        ),
        ListTile(
          leading: Icon(Icons.edit_document),
          title: Text('Préscriptions'),
          onTap: () {
            // Action lors du tap sur l'élément
          },
        ),
        ListTile(
          leading: Icon(Icons.mood),
          title: Text('Gestion d\'humeur'),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Mood()));
          },
        ),
        ListTile(
          leading: Icon(Icons.mood_bad_outlined),
          title: Text('Gestion de douleurs'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => PainManagement()));
          },
        ),
        ListTile(
          leading: Icon(Icons.vaccines),
          title: Text('Dépistage'),
          onTap: () {
            // Action lors du tap sur l'élément
          },
        ),
        Divider(color: Colors.grey),
      ],
    ),
  );
}

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
                Icon(Icons.access_time_outlined, size: 16, color: Colors.grey),
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

//Graphique

Widget buildLineChart() {
  return LineChart(
    LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return Text('Q1');
                case 2:
                  return Text('Q2');
                case 3:
                  return Text('Q3');
                case 4:
                  return Text('Q4');
                case 5:
                  return Text('Q5');
              }
              return Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              return Text('${value.toInt()}');
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 50),
            FlSpot(2, 55),
            FlSpot(3, 70),
            FlSpot(4, 53),
            FlSpot(5, 65),
          ],
          isCurved: true,
          color: Colors.orange,
          barWidth: 3,
          belowBarData: BarAreaData(
            show: true,
            color: Colors.orange.withOpacity(0.1),
          ),
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 4,
              color: Colors.orange,
              strokeWidth: 0,
            ),
          ),
        ),
      ],
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '${touchedSpot.y}',
                const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
    ),
  );
}

Widget buildInfoCard(
    IconData icon, Color iconColor, String title, String subtitle) {
  return Container(
    width: 100,
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
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

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
        color: Colors.white, border: Border.all(color: Colors.grey)),
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
                  ' ${department!}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('${service}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('Issue : ${issus!}'),
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
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 12,
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
            )
          ],
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget buildMeasurementWidgetForMap(String label, String value,
    {Color backgroundColor = Colors.transparent}) {
  return Material(
    elevation: 4,
    shape: CircleBorder(),
    child: Container(
      width: 50,
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
                fontSize: 12,
                color:
                    backgroundColor == Colors.transparent ? null : Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 10,
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
