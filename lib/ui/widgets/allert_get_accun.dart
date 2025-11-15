import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testerapps/constants/config.dart';


class AlertGetAccount extends StatelessWidget {
  const AlertGetAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final adminPhoneNumber = AppConfig.adminPhoneNumber;
    return Center(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png', height: 70),
        content: SizedBox(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "SIMAKS MOBILE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Silakan hubungi admin untuk mendapatkan akun",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onDoubleTap: () {
                  Clipboard.setData(ClipboardData(text: adminPhoneNumber));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Nomor WhatsApp disalin!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(adminPhoneNumber),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 5),
              const Text("Jam Kerja", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("Senin - Jum'at : 08:00 - 16:00 WITA"),
              const Text("Sabtu : 09:00 - 14:00 WITA"),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }
}
