import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/screens/home_screen.dart';
import 'package:sekolahku/screens/register_screen.dart';
import 'package:sekolahku/service/app_service.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({Key key}) : super(key: key);

  @override
  _LoginLayoutState createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String username;
  String password;

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
              Text("SEKOLAH KU"),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                keyboardType: TextInputType.visiblePassword,
              ),
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
                        'LOGIN',
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
                            RegisterScreen()));
                  },
                  child: Text('Create account ',
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
        username = usernameController.text.toString();
        password = passwordController.text.toString();

        AppServices.getloginService.getUsername(username).then((value) {
          if (value != null) {
            AppServices.getloginService
                .getLogin(username, password)
                .then((valueLogin) {
              if (valueLogin != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              } else {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Password salah')));
              }
            }).catchError((error) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Login gagal, periksa user anda dengan benar')));
            });
          } else {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Akun belum terdaftar')));
          }
        }).catchError((error) {
          print(error);
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Login gagal, periksa user anda dengan benar')));
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
