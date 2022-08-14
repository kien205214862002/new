import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: HomeBG(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Setting'),
          ],
      )),
    );
  }
}
