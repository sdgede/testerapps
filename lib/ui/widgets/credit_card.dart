import 'package:flutter/material.dart';
import 'package:testerapps/constants/apps_router.dart';
import 'package:testerapps/constants/config.dart';
import 'package:testerapps/ui/themes/color_thame.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    final biaya = AppConfig.Biaya;
    final id_pembayaran = AppConfig.id_pembayaran;
    final last_date = AppConfig.last_date;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            // offset: Offset(1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bagian kiri warna kuning dengan ikon
          Container(
            width: 100,
            height: 115,
            decoration: const BoxDecoration(
              color: Color(0xFFF8B232),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                topRight: Radius.circular(90),
                bottomRight: Radius.circular(90),
              ),
            ),
            child:  Center(
              child: Container( padding: EdgeInsets.all(15), decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ), child:  Icon(Icons.receipt_long, size: 30, color: ColorTheme.primaryColor)),
            ),
          ),

          const SizedBox(width: 16),

          // Informasi tagihan (gunakan Expanded DI SINI)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total Tagihan", style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    biaya,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A237E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("ID Pembayaran", style: TextStyle(fontSize: 12)),
                            const SizedBox(height: 2),
                            Text(id_pembayaran, style: const TextStyle(fontWeight: FontWeight.bold, color: ColorTheme.textColor)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const Text("Jatuh Tempo", style: TextStyle(fontSize: 12)),
                           const SizedBox(height: 2),
                           Text( last_date, style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Tombol Bayar
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: ColorTheme.primaryColor),
                backgroundColor: const Color(0xFFFFF7E6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppsRouter.payment);
              },
              child: const Text(
                "Bayar",
                style: TextStyle(
                  color: ColorTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
