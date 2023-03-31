import 'package:flutter/material.dart';

class LandingHomeDisplay extends StatelessWidget {
  const LandingHomeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: const [
              Text("Welcome to HanGoGo HOME"),
            ],
          ),
        ],
      ),
    );
  }
}
