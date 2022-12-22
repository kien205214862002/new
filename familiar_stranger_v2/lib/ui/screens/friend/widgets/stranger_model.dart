import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:familiar_stranger_v2/controllers/user/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class StrangerModel extends StatefulWidget {
  String friendName;
  String status;
  String avatarUrl;
  VoidCallback onPressedAdd;
  VoidCallback onPressed;
  StrangerModel({
    Key? key,
    required this.friendName,
    required this.status,
    required this.avatarUrl,
    required this.onPressedAdd,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<StrangerModel> createState() => _StrangerModelState();
}

class _StrangerModelState extends State<StrangerModel> {
  UserController userController = Get.put(UserController());
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
          GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              height: 70 * size.height / 896,
              width: 70 * size.height / 896,
              decoration: BoxDecoration(
                  color: secondaryText,
                  border: Border.all(color: fieldBorder, width: 2.5),
                  borderRadius: const BorderRadius.all(Radius.circular(200.0))),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.avatarUrl),
                  radius: 95.0,
                ),
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
                GestureDetector(
                  onTap: widget.onPressedAdd,
                  child: Container(
                    height: 35 * size.height / 896,
                    width: 100 * size.width / 414,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: fieldBorder, width: 2),
                        color: thirdColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      widget.status == 'Waiting' ? 'Wait' : 'Follow',
                      style: const TextStyle(
                          fontSize: 13,
                          color: secondaryText,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
