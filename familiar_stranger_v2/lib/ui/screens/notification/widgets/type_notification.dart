import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TypeNotification extends StatefulWidget {
  String type;
  String content;
  Function(BuildContext) accept;
  Function(BuildContext) reject;

  TypeNotification(
      {Key? key,
      required this.type,
      required this.content,
      required this.accept,
      required this.reject})
      : super(key: key);

  @override
  State<TypeNotification> createState() => _TypeNotificationState();
}

class _TypeNotificationState extends State<TypeNotification> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: widget.accept,
            icon: Icons.done_outline_rounded,
            backgroundColor: Color(0xFF78a55a),
          )
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: widget.reject,
            icon: Icons.delete_outline_rounded,
            backgroundColor: Color(0xFFbb271a),
          )
        ],
      ),
      child: Container(
        height: 80 * size.height / 896,
        width: 335 * size.width / 414,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: secondaryText,
            border: Border.all(color: fieldBorder, width: 2.5),
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Text(
          widget.content,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: primaryText),
        ),
      ),
    );
  }
}
