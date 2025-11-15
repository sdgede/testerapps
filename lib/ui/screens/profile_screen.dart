import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/ui/routes/botton_navigator_route.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:testerapps/ui/widgets/cliper_header.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CostumeBottomNavigationBar(
      currentIndex: 4,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorTheme.disabaccentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CliperHeader(),
            child: Container(
              height: 100,
              color: ColorTheme.primaryColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorTheme.textColor, width: 1),
            ),
            child: Row(
              children: [
                // Bagian kiri 50%
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          "SIMAKS",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.textColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "NAME",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.disableButtonColor,
                          ),
                        ),
                        Text(
                          "Made Wayan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.textColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "NISN",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.disableButtonColor,
                          ),
                        ),
                        Text(
                          "432 873 311 8",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorTheme.textColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: ColorTheme.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Kelas XXII",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:  Colors.black,

                          image: DecorationImage(
                            image: AssetImage("assets/images/bg-pattern.png"),
                            fit: BoxFit.cover,
                            opacity: 0.4,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}