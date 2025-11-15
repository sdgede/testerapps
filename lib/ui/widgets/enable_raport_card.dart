import 'package:flutter/material.dart';
import 'package:testerapps/ui/themes/color_thame.dart' show ColorTheme;

class EnableCardRapor extends StatelessWidget {
  const EnableCardRapor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.black12, width: 1),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: ColorTheme.accentColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.school,
              size: 50,
              color: ColorTheme.primaryColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Raport Semester 1",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Tahun Ajaran 2023/2024",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Implement download functionality here
                },
                child: Container(
                  width: MediaQuery.of(context).size.width /1.8,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorTheme.primaryColor,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    "Detail",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}




