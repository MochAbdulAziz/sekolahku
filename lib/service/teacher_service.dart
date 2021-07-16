import 'package:sekolahku/domain/student_domain.dart';
import 'package:sekolahku/domain/teacher_domain.dart';
import 'package:sekolahku/repository/student_repository.dart';
import 'package:sekolahku/repository/teacher_repository.dart';
import 'package:sekolahku/service/app_service.dart';

class TeacherService{
  final TeacherRepository teacherRepository;

  TeacherService(this.teacherRepository);

  Future<int> createTeacher(TeacherDomain teacherDomain){
      return teacherRepository.create(teacherDomain);
  }

  Future<void> deleteTeacher(int index){
    return teacherRepository.delete(index);
  }

  Future<List<TeacherDomain>>readTeacher(String keyword){
    return teacherRepository.readTeacher(keyword);
  }

  Future<TeacherDomain> teacherById(int index){
    return teacherRepository.teacherById(index);
  }

  Future<int> updateTeacher(int id, TeacherDomain teacherDomain){
    return teacherRepository.updateTeacher(id, teacherDomain);
  }
  
}