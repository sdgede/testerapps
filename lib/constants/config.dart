import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  AppConfig._(); 

  static  String adminPhoneNumber = dotenv.env['PHONE_NUMBER'] ?? '';
  static  String virtualBank = dotenv.env['VA'] ?? '';
  static String nama = dotenv.env['NAMA'] ?? '';
  static String id_pembayaran = dotenv.env['ID_PEMBAYARAN'] ?? '';
  static String Biaya = dotenv.env['BIAYA'] ?? '';
  static String last_date = dotenv.env['LAST_DATE'] ?? '';

  
  static String BaseUrl  = dotenv.env['BASE_URL'] ?? '';


}
