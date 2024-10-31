import 'package:flutter/material.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/screen/auth/codeOtp.dart';
import 'package:hcmobile/screen/auth/resetPassWord.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: Image.asset('assets/reset.png', width: 70, height: 70),
              ),
              SizedBox(height: 20),
              Text(
                'Mot de passe Oublié?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 64, 123, 255),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Entrez le numéro de téléphone associé à votre compte',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      hintText: 'Entrer le numéro ici ...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Essayer autrement',
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 123, 255),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    // String phoneNumber = phoneNumberController.text.trim();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EmailVerificationPage(
                          phoneNumber: '0999257953',
                          verificationCode: 1253,
                        ),
                      ),
                    );

                    // if (phoneNumber.isNotEmpty) {
                    //   var result =
                    //       await UserController.resetPassword(phoneNumber);

                    //   if (result['success']) {

                    //   } else {

                    //     showDialog(
                    //       context: context,
                    //       builder: (context) {
                    //         return AlertDialog(
                    //           title: Text("Erreur"),
                    //           content: Text(result['message']),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: Text("OK"),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   }
                    // } else {
                    //   // if the field is empty
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: Text("Erreur"),
                    //         content: Text(
                    //             "Veuillez entrer un numéro de téléphone valide."),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Navigator.pop(context);
                    //             },
                    //             child: Text("OK"),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Color.fromARGB(255, 64, 123, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Envoyer',
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
}
