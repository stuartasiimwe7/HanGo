import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hango/widgets/firebase_helper.dart';

class UserHomeScreen extends StatelessWidget {
  UserHomeScreen({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }
  Widget _userId() {
    return Text(user?.email??'User Email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut, child: const Text('Sign Out')
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _title()
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userId(),
            _signOutButton()

          ],
        ),
      ),
    );
  }
}
