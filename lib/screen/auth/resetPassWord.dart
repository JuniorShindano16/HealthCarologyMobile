// import 'package:flutter/material.dart';
// import 'package:hcmobile/screen/auth/codeOtp.dart';
// import 'package:hcmobile/screen/auth/login.dart';

// class ResetPage extends StatefulWidget {
//   @override
//   State<ResetPage> createState() => _ResetPageState();
// }

// class _ResetPageState extends State<ResetPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100, // Couleur d'arrière-plan douce
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Image de la clé
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 60,
//                   child:
//                       Image.asset('assets/reset.png', // Remplace par ton image
//                           width: 70,
//                           height: 70),
//                 ),
//                 SizedBox(height: 20),

//                 // Texte "Forgot password?"
//                 Text(
//                   'Redefinissez votre Mot de passe',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(
//                         255, 64, 123, 255), // Couleur bleue pour le titre
//                   ),
//                 ),
//                 SizedBox(height: 10),

//                 // Sous-titre
//                 Text(
//                   'Entrez le nouveau mot de passe et gardez le secret',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey.shade600,
//                   ),
//                 ),
//                 SizedBox(height: 30),

//                 // Champ email
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                         hintText: 'Nouveau Mot de passe ...',
//                         border: InputBorder.none,
//                         hintStyle: TextStyle(
//                           color: Colors.grey.shade400,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),

//                 // Champ email
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                         hintText: 'Confirmer Mot de passe ...',
//                         border: InputBorder.none,
//                         hintStyle: TextStyle(
//                           color: Colors.grey.shade400,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 40),

//                 // Bouton "Reset Password"
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (_) => LoginPage()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       backgroundColor: Color.fromARGB(
//                           255, 64, 123, 255), // Couleur bleue du bouton
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Text(
//                       'Envoyer',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hcmobile/screen/auth/login.dart';

class ResetPage extends StatefulWidget {
  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  // Controllers pour récupérer les valeurs des TextFields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Variables pour vérifier si les mots de passe correspondent
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isMatching = true;

  // Fonction pour vérifier si les mots de passe sont identiques
  void _validatePasswords() {
    setState(() {
      _isMatching = _passwordController.text ==
          _confirmPasswordController.text; // Met à jour la correspondance
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Couleur d'arrière-plan douce
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image de la clé
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: Image.asset(
                    'assets/reset.png', // Remplace par ton image
                    width: 70,
                    height: 70,
                  ),
                ),
                SizedBox(height: 20),

                // Texte "Redéfinissez votre Mot de passe"
                Text(
                  'Redéfinissez votre Mot de passe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 64, 123, 255),
                  ),
                ),
                SizedBox(height: 10),

                // Sous-titre
                Text(
                  'Entrez le nouveau mot de passe et gardez-le secret',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 30),

                // Nouveau Mot de passe
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isMatching ? Colors.grey.shade300 : Colors.red,
                    ), // Bordure rouge si les mots de passe ne correspondent pas
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        hintText: 'Nouveau Mot de passe ...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (value) {
                        _validatePasswords(); // Valider les mots de passe quand l'utilisateur tape
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Confirmer Mot de passe
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _isMatching ? Colors.grey.shade300 : Colors.red,
                    ), // Bordure rouge si les mots de passe ne correspondent pas
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                        hintText: 'Confirmer Mot de passe ...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      onChanged: (value) {
                        _validatePasswords(); // Valider les mots de passe quand l'utilisateur tape
                      },
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Bouton "Envoyer"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isMatching) {
                        // Ajouter la logique de validation ou soumission ici
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      } else {
                        // Afficher un message d'erreur
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Les mots de passe ne correspondent pas"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: _isMatching
                          ? Color.fromARGB(255, 64, 123, 255)
                          : Colors.grey, // Désactiver le bouton si non égal
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
      ),
    );
  }
}
