import '../screens/home_screen.dart';
import '../screens/community_screen.dart';
import '../screens/self_prep_screen.dart';
import '../screens/others_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'HanGoGo',
      home: LandingPage(),
    );
  }
}

// Main Screen
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> _tabs = [
    const HomeScreen(), // see the HomeTab class below
    const CommunityScreen(), // see the CommunityTab class below
    const SelfPrepScreen(), // see the SelfPrepTab class below
    const OthersScreen() //see the OthersTab class below
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded), label: 'Community'),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'Self Prep'),
              BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded), label: 'Others')
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          });
  }
}