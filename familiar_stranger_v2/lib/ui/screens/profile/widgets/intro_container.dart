import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroContainer extends StatefulWidget {
  String name;
  int birth;
  String genderLink;
  String description;
  String status;
  IntroContainer(
      {Key? key,
      required this.name,
      required this.birth,
      required this.genderLink,
      required this.description,
      required this.status})
      : super(key: key);

  @override
  State<IntroContainer> createState() => _IntroContainerState();
}

class _IntroContainerState extends State<IntroContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30 * size.height / 896,
          ),
          Row(
            children: [
              const Text(
                'Fullname:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10 * size.height / 896,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30 * size.height / 896,
          ),
          Row(
            children: [
              const Text(
                'Age',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10 * size.height / 896,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.birth.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30 * size.height / 896,
          ),
          Row(
            children: [
              const Text(
                'Gender',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3 * size.height / 896,
              ),
              Image.asset(
                widget.genderLink,
                scale: 4,
              ),
            ],
          ),
          SizedBox(
            height: 30 * size.height / 896,
          ),
          const Text(
            'Description:',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10 * size.height / 896,
          ),
          Container(
            height: 107 * size.height / 896,
            width: 178 * size.width / 414,
            color: Colors.transparent,
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
