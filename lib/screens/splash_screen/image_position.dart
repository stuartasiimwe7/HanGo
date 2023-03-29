import 'package:flutter/cupertino.dart';

class ImagePosition extends StatelessWidget {
  const ImagePosition({Key? key, this.top = -50}) : super(key: key);
  final double top;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
