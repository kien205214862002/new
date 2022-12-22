import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:familiar_stranger_v2/models/image.dart' as img;

// ignore: must_be_immutable
class ImageShow extends StatelessWidget {
  ValueChanged onChanged;
  List<img.Image> list;
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
      children: (list.length > 1)
          ? List.generate(list.length - 1, (index) {
              return Image.network(list[index + 1].imageUrl!);
            })
          : List.generate(1, (_) {
              return Image.network('https://res.cloudinary.com/fs-app/image/upload/v1649060973/unnamed_vfgxcq.png');
            }),
      // children: Bu8i,
    );
  }
}
