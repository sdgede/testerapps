import 'dart:convert';
import 'package:testerapps/constants/config.dart';
import 'package:testerapps/data/models/student_modal.dart';
import 'package:testerapps/ui/bloc/auth_block.dart';  
import 'package:http/http.dart' as http;

class StudentApi {
  final String baseUrl = AppConfig.BaseUrl; // Ganti dengan URL backend yang sebenarnya

  // Fungsi untuk login (send nisn & password ke server)
  Future<LoginSuccess> login(String nisn, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'nisn': nisn, 'password': password}),
  );

  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);
    return LoginSuccess(decoded['token'], decoded['user']['username']);
  } else {
    throw Exception('Login gagal: ${response.statusCode}');
  }
}


  // Fungsi untuk mengambil siswa (fetch students)
  Future<List<Student>> fetchStudents(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/auth/show'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((e) => Student.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }
}
