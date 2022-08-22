import 'package:flutter/material.dart';

class CallingBG extends StatefulWidget {
  final Widget child;
  const CallingBG({Key? key, required this.child}) : super(key: key);

  @override
  State<CallingBG> createState() => _CallingBGState();
}

class _CallingBGState extends State<CallingBG> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: [
            //BackGround
            // Positioned.fill(
            //   child: Container(
            //     height: size.height,
            //     width: size.width,
            //     color: callingBG,
            //   )),
            
              widget.child,
          ],
        ),
    );
  }
}