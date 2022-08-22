import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogNotification extends StatefulWidget {
  String title;
  String imgLink;
  DialogNotification(
      {Key? key,
      required this.title,
      required this.imgLink})
      : super(key: key);

  @override
  State<DialogNotification> createState() => _DialogNotificationState();
}

class _DialogNotificationState extends State<DialogNotification> {
  @override
  void initState(){

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
      backgroundColor: fieldBorder.withOpacity(0.3),
      child: Container(
        height: 160 * size.height / 896,
        width: 275 * size.width / 414,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: fieldColor,
            border: Border.all(color: fieldBorder, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/', scale: 3,),
            SizedBox(height: 15*size.height/896,),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
