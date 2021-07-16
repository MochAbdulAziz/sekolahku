import 'package:sekolahku/utils/capitalize.dart';

class LoginDomain {
  int idLogin;
  String username;
  String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      
    };
  }

  void fromMap(Map<String, dynamic> value) {
    idLogin = value['id_login'];
    username = value['username'];
    password = value['password'];
    }
}
