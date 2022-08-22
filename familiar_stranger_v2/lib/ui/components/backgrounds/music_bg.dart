import 'package:flutter/material.dart';

class MusicBG extends StatefulWidget {
  final Widget child;
  const MusicBG({Key? key, required this.child}) : super(key: key);

  @override
  State<MusicBG> createState() => _MusicBGState();
}

class _MusicBGState extends State<MusicBG> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Center(
        child: Stack(
          children: [
            // //BackGround
            // Positioned.fill(
            //   top: 0*size.height/896,
            //   left: 0,
            //   child: Container(
            //     height: 127*size.height/896,
            //     width: double.infinity,
            //     color: primaryColor,
            //     child: Image.asset('assets/images/Vector.png', fit: BoxFit.fill,),
            //   )),
            
              widget.child,
          ],
        ),
    );
  }
}