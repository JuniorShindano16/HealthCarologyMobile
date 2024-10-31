
import 'dart:convert';
import 'package:hcmobile/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final storage = GetStorage();
  UserModel? userModelTosend;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }



  Future<bool> logoutUser() async {
    try {
      await storage.erase(); // Efface toutes les données stockées

      return true;
    } catch (e) {
      print('Erreur lors de la déconnexion: $e');
      return false;
    }
  }

  static Future<bool> loginUser(Map<String, String> map) async {
    try {
      var url = Uri.parse('https://healthcarology.org/api/login');

      print('Endpoint : $url');
      print('Body used: ${jsonEncode(map)}');

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(map),
      );

      print('Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String token = jsonResponse['token'];
        var userData = jsonResponse['data'];

        UserModel userModel = UserModel.fromJson(userData);

        final storage = GetStorage();
        await storage.write('token', token);
        await storage.write('userData', userModel.toJson());

        print("Données utilisateur connexion: ${userModel.toJson()}");

        return true;
      } else {
        print('Errorrrrrrrrrrrrrr: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Exception find: $e');
      return false;
    }
  }

  void loadUserData() {
    var userData = storage.read('userData');
    if (userData != null) {
      userModelTosend = UserModel.fromJson(userData);
      print("User data loaded: ${userModelTosend?.toJson()}");
    } else {
      print("No data loadeddddddddddddddddddddddddddddddddd");
    }
  }

  static Future<Map<String, dynamic>> resetPassword(String phoneNumber) async {
    try {
      var url = Uri.parse('https://healthcarology.org/auth/reset/password');

      print('Endpoint: $url');
      print('Body: ${jsonEncode({"phoneNumber": phoneNumber})}');

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "phoneNumber": phoneNumber,
        }),
      );

      print('Statut de la réponse: ${response.statusCode}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Réi: ${jsonResponse['message']}");
        return {
          'success': true,
          'data': jsonResponse['data']['checker'],
          'message': jsonResponse['message'],
        };
      } else if (response.statusCode == 404) {
        var errorResponse = jsonDecode(response.body);
        print("Erreur: ${errorResponse['hydra:description']}");
        return {
          'success': false,
          'message': errorResponse['hydra:description'],
        };
      } else {
        print("Erreur de réinitialisation: ${response.statusCode}");
        return {
          'success': false,
          'message': "Une erreur est survenue.",
        };
      }
    } catch (e) {
      print('Exception lors de la réinitialisation: $e');
      return {
        'success': false,
        'message': 'Une exception est survenue.',
      };
    }
  }

  UserModel? getUserModel() {
    return userModelTosend;
  }

  String? getToken() {
    return storage.read('token');
  }
}


/**class UserController extends GetxController {
  final storage = GetStorage();
  UserModel? userModelTosend;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // Méthode de déconnexion
  Future<bool> logoutUser() async {
    try {
      await storage.erase(); // Efface toutes les données stockées
      userModelTosend = null; // Réinitialise l'utilisateur localement
      return true;
    } catch (e) {
      print('Erreur lors de la déconnexion: $e');
      return false;
    }
  } */