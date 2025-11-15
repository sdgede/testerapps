// Custom clipper dengan lekukan bawah 25px
import 'package:flutter/material.dart';

class CliperHeader extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 25); // Garis vertikal turun

    // Lengkungan ke dalam (cekung)
    path.quadraticBezierTo(
      size.width / 2, size.height + 25, // titik kontrol di tengah + 25px ke bawah
      size.width, size.height - 25,     // titik akhir lengkung
    );

    path.lineTo(size.width, 0); // Naik ke pojok kanan atas
    path.close(); // Nutup path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
