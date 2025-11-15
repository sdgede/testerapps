class StudentResponse {
  final String status;
  final String pesan;
  final String token;
  final List<Student> data;

  StudentResponse({
    required this.status,
    required this.pesan,
    required this.token,
    required this.data,
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) {
    var students = (json['data'] as List)
        .map((e) => Student.fromJson(e))
        .toList();

    return StudentResponse(
      status: json['status'],
      pesan: json['pesan'],
      token: json['token'],
      data: students,
    );
  }
}

class Student {
  final String nisn;
  final String nis;
  final String nama;
  final String kelas;

  Student({
    required this.nisn,
    required this.nis,
    required this.nama,
    required this.kelas,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      nisn: json['nisn'],
      nis: json['nis'],
      nama: json['nama'],
      kelas: json['kelas'],
    );
  }
}
