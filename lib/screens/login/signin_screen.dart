import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hango/screens/login/home_screen.dart';
import 'package:hango/screens/login/signup_screen.dart';
import 'package:hango/widgets/res_widgets.dart';
import 'package:hango/widgets/firebase_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String errorMessage = '';
  bool isLogin = true;
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.grey),
          ),
          //logo
          const Padding(padding: EdgeInsets.fromLTRB(20, 50, 20, 5)),
          const Icon(
            Icons.person_outline,
            size: 200,
            color: Colors.lightBlue,
          ),

          const SizedBox(
            height: 15,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: resTextField("Enter Email or User Name", Icons.verified_user,
                false, _emailTextController),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15),
            child: resTextField("Enter Password Please", Icons.lock_outline,
                true, _passwordTextController),
          ),
          const SizedBox(
            height: 10,
          ),
          signInSignUpButton(context, true, () {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                .then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const HomeScreen())));
            }).onError((error, stackTrace) {
              print("Error ${error.toString()}");
            });
          }),
          signUpOption()
        ],
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have an Account?",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const SignUpScreen())));
          },
          child: const Text(
            " - Sign Up",
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
