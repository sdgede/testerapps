import 'package:flutter/material.dart';
import 'package:testerapps/constants/apps_router.dart';
import 'package:testerapps/ui/themes/color_thame.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight / 3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/kegiatan.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // GRADASI PUTIH DARI BAWAH
              Positioned(
                bottom: 0,
                child: Container(
                  height: screenHeight / 6,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.transparent],
                    ),
                  ),
                ),
              ),

              // BACK BUTTON & TITLE
              Positioned(
                top: 40, // aman dari notch
                left: 16,
                right: 16,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context, AppsRouter.event, (route) => false);
                      },
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'Bulan Bahasa',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 232, 232, 232),
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // KONTEN
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Bulan Bahasa',
                        style: TextStyle(
                          color: ColorTheme.textColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '12 - 07 - 2024',
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Kegiatan Bulan Bahasa adalah kegiatan yang diadakan setiap tahun untuk memperingati bulan bahasa. Kegiatan ini diadakan untuk meningkatkan kesadaran masyarakat akan pentingnya bahasa dan sastra dalam kehidupan sehari-hari.",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorTheme.textColor,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Waktu dan Tempat",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "WAKTU : 12 - 07 - 2020\n"
                        "TEMPAT : Aula Sekolah",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorTheme.textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorTheme.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.campaign,
                                color: ColorTheme.primaryColor),
                            const Text(
                              "Info penting",
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorTheme.primaryColor,
                              ),
                            ),
                          ],
                          
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Kegiatan ini wajib diikuti oleh semua siswa kelas 10 dan 11. Siswa yang tidak mengikuti kegiatan ini akan mendapatkan sanksi.",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorTheme.disablePrimary,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), 
                 

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Add your onTap functionality here
                      },
                      child: const Center(
                        child: Text(
                          "Ingatkan Saya Pengingat",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.textColor,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
