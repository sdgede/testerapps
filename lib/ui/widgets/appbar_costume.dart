import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/constants/config.dart';
import 'package:testerapps/ui/themes/color_thame.dart';


class CustomHeaderAppBar extends StatelessWidget {
  const CustomHeaderAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void _showTopSnackBar(String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(8),
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
    final virtualAccount = AppConfig.virtualBank;
    final name = AppConfig.nama;

    String getSalam() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 10) {
      return "Selamat pagi";
    } else if (hour >= 10 && hour < 15) {
      return "Selamat siang";
    } else if (hour >= 15 && hour < 18) {
      return "Selamat sore";
    } else {
      return "Selamat malam";
    }
  }

    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,

      backgroundColor: ColorTheme.primaryColor,
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon dalam lingkaran putih
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_circle_rounded,
                    size: 28,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      '${getSalam()}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    size: 28,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: GestureDetector(
                onTap: () {
                  // copy
                  final data = ClipboardData(text: virtualAccount);
                  Clipboard.setData(data).then((_) {
                    _showTopSnackBar("VA berhasil disalin");
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "VA: " + virtualAccount,
                      style: TextStyle(fontSize: 14, color: Colors.amber),
                    ),
                    Image(image: AssetImage("assets/images/icon.png")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
