import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

// ignore: must_be_immutable
class ImageShow extends StatelessWidget {
  ValueChanged onChanged;
  List<String> list;
  ImageShow({
    Key? key,
    required this.onChanged,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.transparent,
      indicatorBackgroundColor: Colors.transparent,
      initialPage: 0,
      isLoop: true,
      onPageChanged: onChanged,
      children: List.generate(list.length, (index) {
        return Image.network("https://i.imgur.com/n3nKtWa.jpg");
      }),
      // children: Bu8i,
    );
  }
}
