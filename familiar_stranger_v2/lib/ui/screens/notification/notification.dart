import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        children:[ SingleChildScrollView(
          child: HomeBG(
            child: Column(
              
            ),
          ),
        ),
        ]
      ),
    );
  }
}