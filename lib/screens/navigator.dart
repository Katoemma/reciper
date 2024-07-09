import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:reciper/screens/home_screen.dart';
import 'package:reciper/screens/notifications_screen.dart';
import 'package:reciper/screens/profile_screen.dart';
import 'package:reciper/screens/search_screen.dart';
import 'package:reciper/utilities/constants.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Main App'),
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: reddish,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        activeColor: reddish,
        activeIndex: _selectedIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 18,
        rightCornerRadius: 18,
        borderColor: reddish,
        icons: const [
          Icons.home,
          Icons.search,
          Icons.notifications,
          Icons.person_2_sharp
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
