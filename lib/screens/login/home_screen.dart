import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hango/screens/login/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        leading: IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.menu),
          ),
      ),
        body: Center(
            child: ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Signed Out");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SignInScreen())));
                  });
                })));
  }
}