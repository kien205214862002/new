import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:flutter/material.dart';

class ListFriendScreen extends StatefulWidget {
  const ListFriendScreen({Key? key}) : super(key: key);

  @override
  State<ListFriendScreen> createState() => _ListFriendScreenState();
}

class _ListFriendScreenState extends State<ListFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: HomeBG(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('List Friend'),
          ],
      )),
    );
  }
}
