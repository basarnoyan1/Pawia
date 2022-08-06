import 'package:flutter/material.dart';
import 'package:takeep_pet/notif.dart';
import 'package:takeep_pet/profile.dart';
import 'package:takeep_pet/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class FlyControl extends StatefulWidget {
  const FlyControl({Key? key}) : super(key: key);

  @override
  State<FlyControl> createState() => _FlyControlState();
}

class _FlyControlState extends State<FlyControl> {
  PageController _pageController = PageController();
  List<Widget> _screens = [NotifScreen(), HomeScreen(), ProfileScreen()];
  int _selectedIndex = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("assets/notif_icon.png"),
              label: "Notifications"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/home_icon.png"), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/profile_icon.png"), label: "Profile"),
        ],
      ),
    );
  }
}
