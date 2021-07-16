import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/domain/login_domain.dart';
import 'package:sekolahku/screens/home_screen.dart';
import 'package:sekolahku/screens/login_screen.dart';
import 'package:sekolahku/service/app_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.all(25.0),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text("Register "),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)))),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)))),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.grey,
                  onPressed: () {
                    onLoginPressed();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'SUBMIT ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) =>
                            LoginLayout()));
                  },
                  child: Text('Have account?',
                      style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (usernameController.text != null) {
      if (passwordController.text != null) {
        LoginDomain loginDomain = LoginDomain();
        loginDomain.username = usernameController.text.toString();
        loginDomain.password = passwordController.text.toString();
        AppServices.getloginService
            .getUsername(usernameController.text.toString())
            .then((value) {
          if (value == null) {
            AppServices.getloginService
                .createLogin(loginDomain)
                .then((valueCreate) {
              Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) =>
                            LoginLayout()));
            }).catchError((error) {
              print(error);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(error.toString())));
            });
          } else {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Akun telah terdaftar')));
          }
        }).catchError((error) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Register gagal')));
        });
      } else {
        print("masuk else password");
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(content: new Text('Anda belum mengisi password')));
      }
    } else {
      print("masuk else username");
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text('Anda belum mengisi username')));
    }
  }
}
