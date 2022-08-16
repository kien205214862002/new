import 'package:flutter/material.dart';

class IntroContainer extends StatefulWidget {
  const IntroContainer({Key? key}) : super(key: key);

  @override
  State<IntroContainer> createState() => _IntroContainerState();
}

class _IntroContainerState extends State<IntroContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 5*size.height/896,),
        const Text('data'),
      ],
    );
  }
}