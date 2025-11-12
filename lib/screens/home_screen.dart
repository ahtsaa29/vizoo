import 'package:flutter/material.dart';
import 'package:vizoo/resources/auth_methods.dart';
import 'package:vizoo/screens/history_meeting_screen.dart';
import 'package:vizoo/screens/meeting_screen.dart';
import 'package:vizoo/utils/colors.dart';
import 'package:vizoo/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetingScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', ontap: () => AuthMethods().signOut()),
  ];
  onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onPageChanged,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'Meeting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: pages[_pageIndex],
    );
  }
}
