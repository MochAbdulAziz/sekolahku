import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/domain/teacher_domain.dart';
import 'package:sekolahku/screens/student/list_siswa_screen.dart';
import 'package:sekolahku/screens/teacher/list_teacher_screen.dart';
import 'package:sekolahku/service/app_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentDomain> _listStudent = <StudentDomain>[];

  List<TeacherDomain> _listTeacher = <TeacherDomain>[];
  String valueKeyword = "";
  bool _idSearch = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Siswa",
                ),
                Tab(
                  text: "Guru",
                ),
              ],
            ),
            title: Text('Sekolahku'),
          ),
          body: TabBarView(
            children: [
              ListSiswaScreen(),
              ListTeacherScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
