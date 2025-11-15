
import 'package:flutter/material.dart';

class HistoryPayment extends StatelessWidget {
  const HistoryPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("ID Pembayaran", style: TextStyle(color: Colors.grey[600], fontSize: 12),),
                Text("AKSHDF", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text("Tanggal Bayar", style: TextStyle(color: Colors.grey[600], fontSize: 12),),
                Text("31 April 2024", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                Text("Rp", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                Text("1,000,000", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
    SizedBox(height: 10,),
    Container(
      height: 1,
      color: Colors.grey[300],
    ),
      ],
    );
  }
}


