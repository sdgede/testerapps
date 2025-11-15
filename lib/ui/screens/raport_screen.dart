import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/ui/routes/botton_navigator_route.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:testerapps/ui/widgets/cliper_header.dart';
import 'package:testerapps/ui/widgets/disable_raport_card.dart';
import 'package:testerapps/ui/widgets/enable_raport_card.dart';

class RaportScreen extends StatefulWidget {
  const RaportScreen({super.key});

  @override
  _RaportScreenState createState() => _RaportScreenState();
}

class _RaportScreenState extends State<RaportScreen> {
  

  @override
  Widget build(BuildContext context) {
    return CostumeBottomNavigationBar(
      currentIndex: 2,
      // ignore: deprecated_member_use
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios , color: Colors.white),  
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Raport', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, '/home');
          return false; 
        },
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CliperHeader(),
                  child: Container(height: 100, color: ColorTheme.primaryColor),
                ),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Cari Rapot atau tahun ajaran',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  EnableCardRapor(),
                  DisableCardRapor(),
                ],
              ),
            ),
          ],
        ),
      ),

     
    );
  }
}


