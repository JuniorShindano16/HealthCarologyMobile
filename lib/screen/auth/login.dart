import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/bd/BdColumnNames.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/screen/auth/motDepasseOublie.dart';
import 'package:hcmobile/screen/auth/register/register.dart';
import 'package:hcmobile/screen/component/bottomAppBar.dart';
import 'package:hcmobile/utils/setting.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController passwordController =
      TextEditingController(text: '227914');
  TextEditingController userNameController =
      TextEditingController(text: '002522552');
  bool loading = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/hlpc.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Text(
                  'Connexion',
                  style: TextStyle(
                    color: Color.fromARGB(255, 64, 123, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Entrez les informations pour vous connecter',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(3, 3),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 64, 123, 255),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(3, 3),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password_outlined,
                        color: Color.fromARGB(255, 64, 123, 255),
                      ),
                      hintText: 'Mot de passe',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 64, 123, 255),
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PasswordResetPage()));
                    },
                    child: Text(
                      'Mot de passe oublié?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 64, 123, 255),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });

                          bool rs = await UserController.loginUser({
                            'username': userNameController.text,
                            'password': passwordController.text,
                          });

                          // if successful
                          if (rs) {
                            await Future.delayed(const Duration(seconds: 2));
                            await Get.defaultDialog(
                              title: "Connexion réussie",
                              titleStyle: TextStyle(
                                color: Color.fromARGB(255, 13, 110, 253),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              middleText: 'Bienvenue sur la plateforme',
                              middleTextStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 18,
                              ),
                              backgroundColor: Color.fromARGB(221, 75, 75, 75),
                              radius: 15,
                              contentPadding: EdgeInsets.all(20),
                              barrierDismissible: false,
                              textConfirm: "OK",
                              confirmTextColor: Colors.white,
                              buttonColor: Color.fromARGB(255, 13, 110, 253),
                              onConfirm: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Bottomngnavbarre()),
                                );
                              },
                              content: Column(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: Color.fromARGB(255, 13, 110, 253),
                                    size: 50,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Bienvenue sur la plateforme',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );

                            // Naviguer vers la page principale
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (_) => Bottomngnavbarre()),
                            // );

                            setState(() {
                              loading = false;
                            });
                            // Get.offAll(const Bottomngnavbarre() );
                          } else {
                            // Si la connexion échoue
                            Get.defaultDialog(
                              title: "Erreur",
                              titleStyle: TextStyle(
                                color: Color.fromARGB(255, 13, 110, 253),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              middleText: "Accès non autorisé",
                              middleTextStyle: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 18,
                              ),
                              backgroundColor:
                                  const Color.fromARGB(221, 75, 75, 75),
                              radius: 15,
                              contentPadding: EdgeInsets.all(20),
                              barrierDismissible: false,
                              textConfirm: "OK",
                              confirmTextColor: Colors.white,
                              buttonColor: Color.fromARGB(255, 13, 110, 253),
                              onConfirm: () {
                                Get.back();
                              },
                              content: Column(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Color.fromARGB(255, 13, 110, 253),
                                    size: 50,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Accès non autorisé",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 64, 123, 255),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Connecter',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Vous N\'avez pas un compe? ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterUi()));
                            },
                            child: Text('Inscription'))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
