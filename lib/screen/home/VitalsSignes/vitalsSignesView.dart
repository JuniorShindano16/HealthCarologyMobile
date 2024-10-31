import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Signesvitaux extends StatefulWidget {
  const Signesvitaux({super.key});

  @override
  State<Signesvitaux> createState() => _SignesvitauxState();
}

class _SignesvitauxState extends State<Signesvitaux> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "Vos Derniers signes Vitaux",
    "Tendances de vos signes vitaux",
  ];

  final List<List<double>> vitalSignTrends = [
    [72, 74, 76, 75, 78, 77, 79, 80, 82, 81],
    [36.5, 36.6, 36.8, 37.0, 36.9, 36.7, 36.8, 36.8, 37.1, 37.0],
    [16, 17, 18, 18, 19, 18, 17, 16, 18, 19],
    [97, 98, 97, 99, 98, 98, 97, 97, 99, 98],
    [90, 92, 95, 94, 93, 91, 92, 94, 95, 96],
    [120, 118, 117, 119, 120, 121, 122, 121, 120, 119],
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> tabContents = [
      Container(
        child: ListView(
          children: [
            buildVitalSignCard('Rythme Cardiaque', '75 bpm', Icons.favorite,
                Color.fromARGB(255, 13, 110, 253), context),
            buildVitalSignCard('Température Corporelle', '36.8 °C',
                Icons.thermostat, Color.fromARGB(255, 13, 110, 253), context),
            buildVitalSignCard('Rythme Respiratoire', '18 breaths/min',
                Icons.air, Color.fromARGB(255, 13, 110, 253), context),
            buildVitalSignCard('Saturation en Oxygène ', '98%', Icons.bloodtype,
                Color.fromARGB(255, 13, 110, 253), context),
            buildVitalSignCard('Glycémie', '95 mg/dL', Icons.monitor_heart,
                Color.fromARGB(255, 13, 110, 253), context),
            buildVitalSignCard(
                'Préssion Arterielle',
                '120/80 mmHg',
                Icons.bloodtype_rounded,
                Color.fromARGB(255, 13, 110, 253),
                context),
            SizedBox(height: 15),
          ],
        ),
      ),
      Container(
        child: ListView(
          children: [
            buildVitalSignGraph(vitalSignTrends),
          ],
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
        foregroundColor: Colors.white,
        title: Text(
          'Signes Vitaux',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
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
            Expanded(child: tabContents[selectedIndex]),
          ],
        ),
      ),
    );
  }
}

void showVitalSignDialog(BuildContext context, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String newValue = '';
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Ajouter une nouvelle valeur pour $title',
          style: TextStyle(color: Colors.black),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Entrez la nouvelle valeur pour $title',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                newValue = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nouvelle valeur',
                labelStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 13, 110, 253)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text('Annuler', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 13, 110, 253),
            ),
            child: Text('Soumettre', style: TextStyle(color: Colors.white)),
            onPressed: () {
              print('Nouvelle valeur soumise pour $title: $newValue');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget buildVitalSignCard(String title, String value, IconData icon,
    Color iconColor, BuildContext context) {
  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 0,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      trailing: InkWell(
        onTap: () {
          showVitalSignDialog(context, title);
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: iconColor.withOpacity(0.2),
        child: Icon(icon, color: iconColor, size: 30),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
    ),
  );
}

Widget buildVitalSignGraph(List<List<double>> vitalSignTrends) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text('Rythme Cardiaque',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[0], 70, 90))),
        SizedBox(height: 20),
        Text('Température Corporelle',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[1], 36, 38))),
        SizedBox(height: 20),
        Text('Rythme Respiratoir',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[2], 15, 20))),
        SizedBox(height: 20),
        Text('Saturation en Oxygène',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[3], 95, 100))),
        SizedBox(height: 20),
        Text('Glycemie',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[4], 80, 110))),
        SizedBox(height: 20),
        Text('Préssion Arterielle',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
            height: 200,
            child: LineChart(buildLineChartData(vitalSignTrends[5], 110, 130))),
      ],
    ),
  );
}

LineChartData buildLineChartData(List<double> data, double minY, double maxY) {
  return LineChartData(
    gridData: FlGridData(show: true),
    titlesData: FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: (maxY - minY) / 5,
          getTitlesWidget: (value, meta) {
            return Text(value.toStringAsFixed(1),
                style: TextStyle(fontSize: 12));
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: (value, meta) {
            return Text('P${value.toInt() + 1}',
                style: TextStyle(fontSize: 12));
          },
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: Colors.grey, width: 1),
    ),
    lineBarsData: [
      LineChartBarData(
        spots: data.asMap().entries.map((entry) {
          return FlSpot(entry.key.toDouble(), entry.value);
        }).toList(),
        isCurved: true,
        color: Color.fromARGB(255, 13, 110, 253),
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
      ),
    ],
    minY: minY,
    maxY: maxY,
  );
}

//Ajout

class EnregistrerSignesVitaux extends StatefulWidget {
  @override
  _EnregistrerSignesVitauxState createState() =>
      _EnregistrerSignesVitauxState();
}

class _EnregistrerSignesVitauxState extends State<EnregistrerSignesVitaux> {
  final _formKey = GlobalKey<FormState>();

  String? _frequenceCardiaque;
  String? _temperature;
  String? _frequenceRespiratoire;
  String? _saturationOxygen;
  String? _glycemie;
  String? _pressionArterielle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Enregistrer Signes Vitaux',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 13, 110, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField("Fréquence cardiaque (bpm)", (value) {
                _frequenceCardiaque = value;
              }),
              buildTextField("Température corporelle (°C)", (value) {
                _temperature = value;
              }),
              buildTextField("Fréquence respiratoire (breaths/min)", (value) {
                _frequenceRespiratoire = value;
              }),
              buildTextField("Saturation en oxygène (%)", (value) {
                _saturationOxygen = value;
              }),
              buildTextField("Glycémie (mg/dL)", (value) {
                _glycemie = value;
              }),
              buildTextField("Pression artérielle (mmHg)", (value) {
                _pressionArterielle = value;
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Enregistrer les données
                    print('Signes vitaux enregistrés :');
                    print('Fréquence cardiaque : $_frequenceCardiaque bpm');
                    print('Température : $_temperature °C');
                    print('Fréquence respiratoire : $_frequenceRespiratoire');
                    print('Saturation en oxygène : $_saturationOxygen%');
                    print('Glycémie : $_glycemie mg/dL');
                    print('Pression artérielle : $_pressionArterielle mmHg');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 13, 110, 253),
                  iconColor: Color.fromARGB(255, 13, 110, 253),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  'Enregistrer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, Function(String) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        cursorErrorColor: Color.fromARGB(255, 13, 110, 253),
        cursorColor: Color.fromARGB(255, 13, 110, 253),
        decoration: InputDecoration(
          prefixStyle: TextStyle(color: Color.fromARGB(255, 13, 110, 253)),
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
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
