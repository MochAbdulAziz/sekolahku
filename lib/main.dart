import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sekolahku/screens/home_screen.dart';
import 'package:sekolahku/screens/login_screen.dart';
import 'package:sekolahku/screens/register_screen.dart';
import 'package:sekolahku/service/app_service.dart';
import 'package:sekolahku/utils/lifecycle_event_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDatabaseReady = false;
  LifecycleEventHandler _lifecycleEventHandler;

  @override
  void initState() {
    super.initState();
    AppServices.openDb().then((value) {
      setState(() {
        isDatabaseReady = true;
      });
    });

    _lifecycleEventHandler = LifecycleEventHandler(
      onResume,
      onInactive,
    );
    WidgetsBinding.instance.addObserver(_lifecycleEventHandler);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_lifecycleEventHandler);

    AppServices.closeDb().then((value) {
      setState(() {
        isDatabaseReady = false;
      });
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: isDatabaseReady
          ? RegisterScreen()
          : Scaffold(
              body: Center(
              child: CircularProgressIndicator(),
            )),
    );
  }

  FutureOr<void> onResume(AppLifecycleState state) {
    return AppServices.openDb().then((value) {
      setState(() {
        isDatabaseReady = true;
      });
      return isDatabaseReady;
    });
  }

  FutureOr<void> onInactive(AppLifecycleState state) {
    return AppServices.openDb().then((value) {
      setState(() {
        isDatabaseReady = false;
      });
      return isDatabaseReady;
    });
  }

  FutureOr<void> onInactiveTeacher(AppLifecycleState state) {}
}
