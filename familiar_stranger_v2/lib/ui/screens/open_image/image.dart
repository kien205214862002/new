import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageScreen extends StatefulWidget {
  String url;
  ImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(top: 17.h, left: 10.w),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
        ),
        body: Container(
          child: PhotoView(
            imageProvider: NetworkImage(widget.url),
          ),
        ),
        ));
  }
}