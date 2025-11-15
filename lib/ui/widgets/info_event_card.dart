import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoEventCard extends StatefulWidget {
  const InfoEventCard({super.key});

  @override
  State<InfoEventCard> createState() => _BannerCardState();
}

class _BannerCardState extends State<InfoEventCard> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _banners = [
    {
      "title": "Bulan Bahasa 2024",
      "desc": "Lestarikan Bahasa nasional melalui bulan bahasa.",
      "image": "assets/images/student-cuate.png"
    },
    {
      "title": "Hari Pendidikan",
      "desc": "Rayakan semangat belajar sepanjang hayat.",
      "image": "assets/images/student-cuate.png"
    },
    {
      "title": "Festival Literasi",
      "desc": "Tingkatkan minat baca dan menulis.",
      "image": "assets/images/student-cuate.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            itemBuilder: (context, index) {
              final banner = _banners[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/vektor1.png"),
                      opacity: 0.10,
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Image.asset(
                          banner["image"]!,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner["title"]!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              banner["desc"]!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Indikator di luar card, kiri bawah
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _banners.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.amber,
                dotColor: Colors.grey,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
