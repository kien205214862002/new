import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/friend/widgets/friend_model.dart';
import 'package:familiar_stranger_v2/ui/screens/friend/widgets/stranger_model.dart';
import 'package:flutter/material.dart';

class ListFriendScreen extends StatefulWidget {
  const ListFriendScreen({Key? key}) : super(key: key);

  @override
  State<ListFriendScreen> createState() => _ListFriendScreenState();
}

class _ListFriendScreenState extends State<ListFriendScreen> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Friend',
            style: TextStyle(
                color: primaryText, fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/icons/FindingUser.png',
                scale: 3,
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: HomeBG(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * size.width / 414),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  fillColor: thirdColor,
                  color: primaryText,
                  borderRadius: BorderRadius.circular(10.0),
                  borderWidth: 2.5,
                  borderColor: fieldBorder,
                  selectedColor: thirdColor,
                  selectedBorderColor: secondaryText,
                  isSelected: isSelected,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 29 * size.width / 414,
                          vertical: 12 * size.height / 896),
                      child: Text('All ',
                          style: isSelected[0]
                              ? const TextStyle(
                                  color: secondaryText,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)
                              : const TextStyle(
                                  color: primaryText, fontSize: 17)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 29 * size.width / 414,
                          vertical: 12 * size.height / 896),
                      child: Text(
                        'Finding',
                        style: isSelected[1]
                            ? const TextStyle(
                                color: secondaryText,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)
                            : const TextStyle(
                                color: primaryText,
                                fontSize: 17,
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 29 * size.width / 414,
                          vertical: 12 * size.height / 896),
                      child: Text(
                        'Free',
                        style: isSelected[2]
                            ? const TextStyle(
                                color: secondaryText,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)
                            : const TextStyle(color: primaryText, fontSize: 17),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int newIndex = 0;
                          newIndex < isSelected.length;
                          newIndex++) {
                        if (newIndex == index) {
                          isSelected[newIndex] = true;
                        } else {
                          isSelected[newIndex] = false;
                        }
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 23 * size.height / 896,
                ),
                Container(
                  height: 649 * size.height / 896,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: secondaryText,
                      border: Border.all(color: fieldBorder, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15 * size.height / 896,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50 * size.width / 414,
                          ),
                          SizedBox(
                            height: 50 * size.height / 896,
                            width: 163 * size.width / 414,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: 'Search...',
                              style: const TextStyle(fontSize: 16),
                              onChanged: (value) {
                                // print(value);
                              },
                            ),
                          ),
                          // SizedBox(
                          //   width: 10 * size.width / 414,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 45 * size.height / 896,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 500 * size.height / 896,
                        child: ListView.separated(
                          // controller: ScrollController(),
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return (isSelected[0] == true ||
                                    isSelected[2] == true)
                                ? FriendModel(friendName: '${index + 1}', status: 'Free', color: Colors.green, onPressed: (){},)
                                : StrangerModel(friendName: '${index + 1}', status: 'Not Friend', onPressedAdd: (){}, onPressed: (){},);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10 * size.height / 896,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        ),
      ]),
    );
  }
}
