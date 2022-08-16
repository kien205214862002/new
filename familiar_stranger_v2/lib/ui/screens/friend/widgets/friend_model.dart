import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FriendModel extends StatefulWidget {
  String friendName;
  FriendModel({Key? key, required this.friendName,})
      : super(key: key);

  @override
  State<FriendModel> createState() => _FriendModelState();
}

class _FriendModelState extends State<FriendModel> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75 * size.height / 896,
      width: 300 * size.width / 414,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 120 * size.width / 414,
              alignment: Alignment.center,
              child: Text(
                widget.friendName,
                style: const TextStyle(
                  fontSize: 15,
                  color: primaryText,
                ),
              )),
          Container(
            height: 70 * size.height / 896,
            width: 70 * size.height / 896,
            decoration: BoxDecoration(
                color: secondaryText,
                border: Border.all(color: fieldBorder, width: 2.5),
                borderRadius: const BorderRadius.all(Radius.circular(200.0))),
          ),
          Container(
            width: 120 * size.width / 414,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Image.asset('assets/icons/Chat-1.png', scale: 5,),
                ),
                SizedBox(width: 10*size.width/414,),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset('assets/icons/Delete-1.png', scale: 5,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
