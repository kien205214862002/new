import 'package:familiar_stranger_v2/config/utils/app_colors.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button_long.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogYesNo extends StatefulWidget {
  String title;
  VoidCallback yes;
  VoidCallback no;
  DialogYesNo(
      {Key? key,
      required this.title,
      required this.yes,
      required this.no})
      : super(key: key);

  @override
  State<DialogYesNo> createState() => _DialogYesNoState();
}

class _DialogYesNoState extends State<DialogYesNo> {
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 10*size.height/896,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButtonLong(
                  borderColor: secondaryText, 
                  backgroundColor: secondaryColor, 
                  textColor: secondaryText, 
                  text: 'Yes', 
                  press: widget.yes),
                RoundButtonLong(
                  borderColor: secondaryColor, 
                  backgroundColor: secondaryText, 
                  textColor: primaryText, 
                  text: 'No', 
                  press: widget.yes),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
