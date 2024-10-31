import 'package:hcmobile/bd/BdColumnNames.dart';

class UserModel {
  int? id;
  String? firstname;
  String? name;
  String? lastname;
  // String? password;
  String? phonenumber;

  UserModel();
  UserModel.fromJson(dynamic map)
      : id = map[Bdcolumnnames.UserId],
        firstname = map[Bdcolumnnames.UserFirstName].toString(),
        lastname = map[Bdcolumnnames.UserLastName].toString(),
        name = map[Bdcolumnnames.UserName].toString(),
        // password = map[Bdcolumnnames.Userpassword].toString(),
        phonenumber = map[Bdcolumnnames.UserPhone].toString();

  Map<String, dynamic> toJson() {
    return {
      Bdcolumnnames.UserId: id,
      Bdcolumnnames.UserFirstName: firstname,
      Bdcolumnnames.UserLastName: lastname,
      Bdcolumnnames.UserName: name,
      Bdcolumnnames.UserPhone: phonenumber,
      // Bdcolumnnames.Userpassword: password
    };
  }
}
