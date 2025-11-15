import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testerapps/constants/config.dart';
import 'package:testerapps/ui/routes/botton_navigator_route.dart';
import 'package:testerapps/ui/widgets/cliper_header.dart';
import 'package:testerapps/ui/widgets/list_payment.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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

  @override
  Widget build(BuildContext context) {
    final virtualAccount = AppConfig.virtualBank;
    return CostumeBottomNavigationBar(
      currentIndex: 1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Pembayaran', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CliperHeader(),
            child: Container(height: 100, color: Colors.amber[600]),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                border: Border.all(color: Colors.black12, width: 1),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header VA
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "VA Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(132, 110, 223, 129),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            final data = ClipboardData(text: virtualAccount);
                            Clipboard.setData(data).then((_) {
                              _showTopSnackBar("VA berhasil disalin");
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                virtualAccount,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 59, 120, 69),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Image(
                                image: AssetImage("assets/images/icon2.png"),
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Tanggal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Tanggal"),
                          Text(
                            "20 April 2023",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("Tanggal Bayar"),
                          Text(
                            "20 April 2023",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "List Pembayaran",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ListPayment(),
                  const SizedBox(height: 20),
                  const HorizontalLine(),
                  const SizedBox(height: 20),
                  const ListPayment(),
                  const SizedBox(height: 20),
                  const HorizontalLine(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Colors.black12);
  }
}
