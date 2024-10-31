import 'package:flutter/material.dart';

class Findspeciality extends StatefulWidget {
  const Findspeciality({super.key});

  @override
  State<Findspeciality> createState() => _FindspecialityState();
}

class _FindspecialityState extends State<Findspeciality> {
  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      backgroundColor: Color(0xFFEFF4FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEFF4FC),
        title: Container(
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10),
            // Section: Category
            Text(
              'Categories',
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
                buildCategoryChip('Neurologist', "assets/brain.png", x / 2),
                buildCategoryChip('Cardiologist', "assets/heart.png", x / 2),
                buildCategoryChip('Orthopedist', "assets/legs.png", x / 2),
                buildCategoryChip('Nephrologist', "assets/reins.png", x / 2),
                buildCategoryChip('Pulmonologist', "assets/lungs.png", x / 2),
                buildCategoryChip('Gastrologist', "assets/estomac.png", x / 2),
                buildCategoryChip('Ophtamologue', "assets/eye.png", x / 2),
                buildCategoryChip('Génicologue', "assets/ovaires.png", x / 2),
                buildCategoryChip('Gastrologist', "assets/foie.png", x / 2),
                buildCategoryChip('Gastrologist', "assets/thumbs.png", x / 2),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Top recherches',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50, // Ajoutez une hauteur explicite ici
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildSearchChip('Neurochirurgien'),
                  SizedBox(
                    width: 5,
                  ),
                  buildSearchChip('Cardiologue'),
                  SizedBox(
                    width: 5,
                  ),
                  buildSearchChip('Génicologiste'),
                  SizedBox(
                    width: 5,
                  ),
                  buildSearchChip('Dermatologue'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCategoryChip(String label, String path, double width) {
  return Container(
    width: width - 10,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
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
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
              color: Color(0xFF90A4AE),
              fontWeight: FontWeight.bold,
              fontSize: 10),
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
