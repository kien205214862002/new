import 'package:familiar_stranger_v2/ui/screens/chat/widgets/message.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  const Conversation({Key? key}) : super(key: key);

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  bool isImage = false;
  bool isYour = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0*size.width/414),
          height: (896-50-75)*size.height/896,
          width: double.infinity,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Message( isImage: isImage, isYour: isYour,);
              },),
        );
  }
}

