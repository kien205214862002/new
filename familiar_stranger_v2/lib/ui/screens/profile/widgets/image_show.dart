import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// ignore: must_be_immutable
class ImageShow extends StatelessWidget {
  ValueChanged onChanged;
  ImageShow({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        indicatorColor: Colors.transparent,
        indicatorBackgroundColor: Colors.transparent,
        initialPage: 0,
        isLoop: true,
        onPageChanged: onChanged,
        children: [
          Image.asset('assets/images/Logo.png'),
          Image.asset('assets/images/Logo.png'),
        ],
        );
  }
}