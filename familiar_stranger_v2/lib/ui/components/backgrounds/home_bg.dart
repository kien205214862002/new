import 'package:flutter/material.dart';

class HomeBG extends StatefulWidget {
  final Widget child;
  const HomeBG({Key? key, required this.child}) : super(key: key);

  @override
  State<HomeBG> createState() => _HomeBGState();
}

class _HomeBGState extends State<HomeBG> {
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