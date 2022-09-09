import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:familiar_stranger_v2/controllers/myController.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FriendModel extends StatefulWidget {
  String friendName;
  Color color;
  String status;
  VoidCallback onPressed;
  FriendModel({
    Key? key,
    required this.friendName,
    required this.color,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<FriendModel> createState() => _FriendModelState();
}

class _FriendModelState extends State<FriendModel> {
  MyController myController = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75 * size.height / 896,
      width: 300 * size.width / 414,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70 * size.height / 896,
              width: 70 * size.height / 896,
              decoration: BoxDecoration(
                  color: secondaryText,
                  border: Border.all(color: fieldBorder, width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(200.0))),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(myController
                      .currentUser.value.imageId![0].imageUrl
                      .toString()),
                  radius: 95.0,
                ),
              ),
            ),
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
              width: 120 * size.width / 414,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5 * size.height / 896,
                    width: 5 * size.height / 896,
                    decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: const BorderRadius.all(Radius.circular(200.0))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.status,
                    style: TextStyle(
                      fontSize: 13,
                      color: widget.color,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
