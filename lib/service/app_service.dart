import 'package:sekolahku/model/student_model_provider.dart';
import 'package:sekolahku/repository/login_repository.dart';
import 'package:sekolahku/repository/student_repository.dart';
import 'package:sekolahku/repository/teacher_repository.dart';
import 'package:sekolahku/service/login_service.dart';
import 'package:sekolahku/service/student_service.dart';
import 'package:sekolahku/service/teacher_service.dart';
import 'package:sqflite/sqlite_api.dart';

StudentRepository studentRepository =
    StudentRepository(StudentModelProvider.getInstance());
TeacherRepository teacherRepository =
    TeacherRepository(StudentModelProvider.getInstance());
LoginRepository loginRepository =
    LoginRepository(StudentModelProvider.getInstance());
StudentService studentService = StudentService(studentRepository);
TeacherService teacherService = TeacherService(teacherRepository);
LoginService loginService = LoginService(loginRepository);

class AppServices {
  static StudentService get getStudentService {
    return studentService;
  }

  static Future<Database> openDb() {
    return StudentModelProvider.getInstance().openDb();
  }

  static Future<Database> closeDb() {
    return StudentModelProvider.getInstance().closeDb();
  }

  static TeacherService get getTeacherService {
    return teacherService;
  }

static LoginService get getloginService {
    return loginService;
  }
  // static Future<Database> openDbTeacher() {
  //   print("TEST DB");
  //   return TeacherModelProvider.getInstance().openDbTeacher();
  // }

  // static Future<void> closeDbTeacher() {
  //   return TeacherModelProvider.getInstance().closeDbTeacher();
  // }
}
