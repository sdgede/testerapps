import 'package:flutter/material.dart';
import 'package:testerapps/ui/routes/botton_navigator_route.dart';
import 'package:testerapps/ui/themes/color_thame.dart';
import 'package:testerapps/ui/widgets/appbar_costume.dart';
import 'package:testerapps/ui/widgets/helper_card.dart';
import 'package:testerapps/ui/widgets/history_payment.dart';
import 'package:testerapps/ui/widgets/info_event_card.dart';
import 'package:testerapps/ui/widgets/cliper_header.dart';
import 'package:testerapps/ui/widgets/credit_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorTheme.textColor,
        ),
      ),
    );
  }

  Widget _riwayatSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sectionTitle("Riwayat Pembayaran"),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Selengkapnya",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
              4,
              (_) => const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: HistoryPayment(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CostumeBottomNavigationBar(
      currentIndex: 0,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: CustomHeaderAppBar(),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CliperHeader(),
            child: Container(height: 100, color: ColorTheme.primaryColor),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              InfoEventCard(),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 10),
                  children: [
                    _sectionTitle("Tagihan Anda Bulan Ini"),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CreditCard(),
                    ),
                    const SizedBox(height: 20),
                    _riwayatSection(),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: HelperCard(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
