import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hcmobile/controllers/userController.dart';
import 'package:hcmobile/models/userModel.dart';
import 'package:hcmobile/screen/auth/login.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});
  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  final Color primaryColor = Color.fromARGB(255, 13, 110, 253);
  final UserController userController = Get.put(UserController());

  bool notificationsEnabled = true;
  bool faceIdEnabled = true;

  @override
  Widget build(BuildContext context) {
    UserModel? user = userController.getUserModel();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  SizedBox(width: 10),
                  Text(
                    '${user.name} ${user.firstname} ${user.lastname}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Paramètres',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.store, color: primaryColor),
                      title: Text('Mes magasins'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('2',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.support_agent, color: primaryColor),
                      title: Text('Support'),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text('Notifications'),
                      value: notificationsEnabled,
                      onChanged: (val) {
                        setState(() {
                          notificationsEnabled = val;
                        });
                      },
                      inactiveTrackColor: Colors.black,
                      activeColor: primaryColor,
                      secondary: Icon(Icons.notifications, color: primaryColor),
                    ),
                    Divider(),
                    SwitchListTile(
                      title: Text('Face ID'),
                      value: faceIdEnabled,
                      onChanged: (val) {
                        setState(() {
                          faceIdEnabled = val;
                        });
                      },
                      inactiveTrackColor: Colors.black,
                      activeColor: primaryColor,
                      secondary: Icon(Icons.face, color: primaryColor),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.lock, color: primaryColor),
                      title: Text('Code PIN'),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'Déconnexion',
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () async {
                    bool? confirmLogout = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text(
                              'Êtes-vous sûr de vouloir vous déconnecter ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('Non'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text('Oui'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirmLogout == true) {
                      bool logoutSuccess = await userController.logoutUser();
                      if (logoutSuccess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Échec de la déconnexion. Réessayez.')),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
