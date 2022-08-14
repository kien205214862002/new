import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        initialPage: 0,
        isLoop: true,
        children: [
          Image.asset('assets/images/Logo.png'),
          Image.asset('assets/images/Logo.png'),
        ],
        onPageChanged: (value){
          print('Current Page: $value');
        },
        );
  }
}