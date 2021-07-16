import 'package:faker/faker.dart';
import 'package:sekolahku/utils/capitalize.dart';

class TeacherDomain {
  int idGuru;
  int nik;
  String firstName;
  String lastName;
  String birthDay;
  String mobilePhone;
  String gender;
  List<String> mata_pelajaran;
  String address;

  String get fullName {
    return "${capitalize(firstName)} ${capitalize(lastName)}";
  }

  static const genders = ["Pria", "Wanita"];
  static const mapelList = ["B. Indo", "B. Inggris", "Matematika"];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'birthday': birthDay,
      'mobile_phone': mobilePhone,
      'gender': gender,
      'mata_pelajaran': mata_pelajaran.join(', '),
      'address': address,
    };
  }

  void fromMap(Map<String, dynamic> value) {
    idGuru = value['id_guru'];
    nik = value['nik'];
    firstName = value['first_name'];
    lastName = value['last_name'];
    birthDay = value['birthday'];
    mobilePhone = value['mobile_phone'];
    gender = value['gender'];
    mata_pelajaran = value['mata_pelarajan'] is String
        ? value['mata_pelajaran'].split(', ')
        : [];
    address = value['address'];
  }
}
