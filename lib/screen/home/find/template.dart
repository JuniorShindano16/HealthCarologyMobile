import 'package:flutter/material.dart';

class MedicalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF4FC), // Couleur de fond
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEFF4FC),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.search, color: Colors.grey.shade500),
            Container(
              width: 230,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10),

            Text(
              'Category',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                buildCategoryChip('Neurologist', Icons.psychology),
                buildCategoryChip('Cardiologist', Icons.favorite),
                buildCategoryChip('Orthopedist', Icons.accessibility_new),
                buildCategoryChip('Nephrologist', Icons.water_drop),
                buildCategoryChip('Pulmonologist', Icons.air),
                buildCategoryChip('Gastrologist', Icons.local_hospital),
              ],
            ),
            SizedBox(height: 20),
            // Section: Top Searches
            Text(
              'Top Searches',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                buildSearchChip('Neurosurgeon'),
                buildSearchChip('Heart Failure'),
                buildSearchChip('Gene Therapy'),
              ],
            ),
            SizedBox(height: 20),
            // Section: Popular Doctor
            Text(
              'Popular Doctor',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            buildDoctorCard(),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryChip(String label, IconData icon) {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      labelPadding: EdgeInsets.symmetric(horizontal: 10),
      label: Row(
        children: [
          Icon(icon, color: Color(0xFF90A4AE), size: 20),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
                color: Color(0xFF90A4AE), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildSearchChip(String label) {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      label: Text(
        label,
        style: TextStyle(color: Color(0xFF90A4AE)),
      ),
    );
  }

  Widget buildDoctorCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/doctor_image.png'),
                radius: 40,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Neurologist',
                    style: TextStyle(color: Color(0xFF90A4AE), fontSize: 14),
                  ),
                  Text(
                    'Dr. William James',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18),
                      SizedBox(width: 5),
                      Text('4.8', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.favorite_border, color: Colors.grey.shade500),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '\$95/session',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Color(0xFF90A4AE)),
              SizedBox(width: 5),
              Text(
                'Availability - 43 slots',
                style: TextStyle(color: Color(0xFF90A4AE)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDateChip('Mon', '16'),
              buildDateChip('Tue', '17'),
              buildDateChip('Wed', '18'),
              buildDateChip('Thu', '19'),
              buildDateChip('Fri', '20'),
              buildDateChip('Sat', '21'),
              buildDateChip('Sun', '22'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDateChip(String day, String date) {
    return Column(
      children: [
        Text(day, style: TextStyle(color: Colors.black)),
        SizedBox(height: 5),
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            date,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class SeatSelectionPopup extends StatefulWidget {
  @override
  _SeatSelectionPopupState createState() => _SeatSelectionPopupState();
}

class _SeatSelectionPopupState extends State<SeatSelectionPopup> {
  int _numberOfSeats = 12; // Nombre de sièges par défaut
  double _pricePerSeat = 12.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Choose seats'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select how many seats you need in your plan.'),
          SizedBox(height: 20),
          // Slider pour choisir le nombre de sièges
          Slider(
            value: _numberOfSeats.toDouble(),
            min: 1,
            max: 100,
            divisions: 99,
            label: '$_numberOfSeats',
            onChanged: (value) {
              setState(() {
                _numberOfSeats = value.toInt();
              });
            },
          ),
          SizedBox(height: 20),
          // Affichage du nombre de sièges
          Text('$_numberOfSeats', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          // Détails des prix
          Text('Price per seat: \$$_pricePerSeat'),
          Text(
              'Total per month: \$${(_numberOfSeats * _pricePerSeat).toStringAsFixed(2)}'),
          Text(
              'Total per month (annual pricing): \$${((_numberOfSeats * _pricePerSeat) * 0.8).toStringAsFixed(2)} (Save 20%)'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fermer le popup
          },
          child: Text('Back'),
        ),
        ElevatedButton(
          onPressed: () {
            // Action pour aller aux détails de paiement
          },
          child: Text('Payment details'),
        ),
      ],
    );
  }
}

//under menu home

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
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
