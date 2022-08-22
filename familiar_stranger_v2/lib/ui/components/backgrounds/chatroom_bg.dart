import 'package:flutter/material.dart';

class ChatRoomBG extends StatefulWidget {
  final Widget child;
  const ChatRoomBG({Key? key, required this.child}) : super(key: key);

  @override
  State<ChatRoomBG> createState() => _ChatRoomBGState();
}

class _ChatRoomBGState extends State<ChatRoomBG> {
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