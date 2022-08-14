import 'package:flutter/material.dart';

class WelcomeBG extends StatefulWidget {
  final Widget child;
  const WelcomeBG({Key? key, required this.child}) : super(key: key);

  @override
  State<WelcomeBG> createState() => _WelcomeBGState();
}

class _WelcomeBGState extends State<WelcomeBG> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: [
            // //BackGround
            // Positioned.fill(
            //   child: Container(
            //     height: size.height,
            //     width: double.infinity,
            //     color: primaryColor,
            //   )),
              widget.child,
          ],
        ),
    );
  }
}