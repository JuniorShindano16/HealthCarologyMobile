import 'package:flutter/material.dart';
import 'package:hcmobile/screen/auth/resetPassWord.dart';

class EmailVerificationPage extends StatefulWidget {

   final String phoneNumber;
  final int verificationCode;

  EmailVerificationPage({required this.phoneNumber, required this.verificationCode});

  
  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Couleur d'arrière-plan douce
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image de l'enveloppe avec la coche verte
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: Image.asset(
                  'assets/otp.png', // Remplace par ton image
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(height: 20),

              // Texte "Verify your email"
              Text(
                'Vérification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 123, 255), // Couleur bleue
                ),
              ),
              SizedBox(height: 10),

              // Sous-titre
              Text(
                'Entrez le code à 4 chiffre que vous avez reçu par SMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 30),

              // Zone d'entrée du code à 4 chiffres
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCodeBox(_controller1, _focusNode1, _focusNode2),
                  _buildCodeBox(_controller2, _focusNode2, _focusNode3),
                  _buildCodeBox(_controller3, _focusNode3, _focusNode4),
                  _buildCodeBox(_controller4, _focusNode4, null),
                ],
              ),
              SizedBox(height: 15),

              // Lien "Resend code"
              GestureDetector(
                onTap: () {
                  // Logique de réenvoi du code
                },
                child: Text(
                  'Renvoyer le code',
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 123, 255),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Bouton "Confirm"
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ResetPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color.fromARGB(
                        255, 64, 123, 255), // Couleur bleue du bouton
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Confirmer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour créer chaque case du code à 4 chiffres
  Widget _buildCodeBox(TextEditingController controller, FocusNode currentFocus,
      FocusNode? nextFocus) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center, // Centrer le texte dans le champ
        keyboardType: TextInputType.number, // Clavier numérique
        maxLength: 1, // Limite à un seul caractère
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) {
            // Si un chiffre est entré, passer au champ suivant
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus(); // Défocus si c'est le dernier champ
            }
          }
        },
      ),
    );
  }
}
