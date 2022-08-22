import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/setting/widgets/click_item.dart';
import 'package:familiar_stranger_v2/ui/screens/setting/widgets/switch_item.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isActiveSound = true;
  bool isActiveNotification = false;
  bool isActiveVibration = false;
  bool isActiveStatus = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3.0),
            child: Container(
              color: primaryText,
              width: 220 * size.width / 414,
              height: 1.5,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Setting',
            style: TextStyle(
                color: primaryText, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Image.asset(
          //       'assets/icons/Back_black.png',
          //       scale: 1 * size.width / 414,
          //     )),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: 5.0 * size.width / 414, top: 5.0 * size.height / 896),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/Logout.png',
                    scale: 3,
                  )),
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
                SizedBox(
                  height: 90 * size.height / 896,
                ),
                SwitchItem(
                    title: 'Sound',
                    subtitle: 'Enable/Disable sounds',
                    isActive: isActiveSound,
                    onChanged: (value) {
                      setState(() {});
                    }),
                SwitchItem(
                    title: 'Notification',
                    subtitle: 'Enable/Disable notifications',
                    isActive: isActiveNotification,
                    onChanged: (value) {
                      setState(() {});
                    }),
                SwitchItem(
                    title: 'Vibration',
                    subtitle: 'Enable/Disable vibrations',
                    isActive: isActiveVibration,
                    onChanged: (value) {
                      setState(() {});
                    }),
                SwitchItem(
                    title: 'Status',
                    subtitle: 'Show/Hide your Free status',
                    isActive: isActiveStatus,
                    onChanged: (value) {
                      setState(() {});
                    }),
                Clickitem(
                    title: 'Change password',
                    subtitle: 'Change current password',
                    onPress: () {}),
                Clickitem(
                    title: 'Policy & Legal',
                    subtitle: 'Read for customer',
                    onPress: () {}),
              ],
            ),
          )),
        ),
      ]),
    );
  }
}
