import 'package:flutter/material.dart';

class HelperCard extends StatelessWidget {
  const HelperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bagian teks
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Anda mengalami kendala?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Hubungi admin kami apabila anda menemui kendala selama menggunakan aplikasi.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16), // Jarak antara teks dan gambar
          Image(
            image: AssetImage("assets/images/help.png"),
            width: 100,
          ),
        ],
      ),
    );
  }
}
