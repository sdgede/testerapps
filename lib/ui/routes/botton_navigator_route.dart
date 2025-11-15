import 'package:flutter/material.dart';
import 'package:testerapps/constants/apps_router.dart';
import 'package:testerapps/ui/widgets/navigator_bar.dart';

class CostumeBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Widget body;
  final PreferredSizeWidget? appBar;

  const CostumeBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.body,
    this.appBar,
  }) : super(key: key);

  @override
  State<CostumeBottomNavigationBar> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<CostumeBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppsRouter.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppsRouter.payment);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppsRouter.raport);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppsRouter.event);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, AppsRouter.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
