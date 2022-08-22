import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/dialog/dialog_yes_no.dart';
import 'package:familiar_stranger_v2/ui/screens/friend/list_friend/list_friend.dart';
import 'package:familiar_stranger_v2/ui/screens/home/home.dart';
import 'package:familiar_stranger_v2/ui/screens/profile/profile.dart';
import 'package:familiar_stranger_v2/ui/screens/setting/setting.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int indexPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigation(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      indexPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 90 * size.height / 896,
            width: 90 * size.height / 896,
            decoration: const BoxDecoration(
                color: thirdColor,
                borderRadius: BorderRadius.all(Radius.circular(200))),
            child: FloatingActionButton(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              backgroundColor:  secondaryColor,
              child: Image.asset(
                'assets/icons/Search.png',
                scale: 3.5,
              ),
              onPressed: () {
                showDialog(
                  // barrierDismissible: false,
                  context: context, 
                  builder: (context){
                    return DialogYesNo(
                      title: 'Opponent want to call you(Only Media).', 
                      yes: (){}, 
                      no: (){});
                  });
              },
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 65 * size.height / 896,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        onPageChanged(0);
                        navigation(0);
                      },
                      iconSize: 35,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Image.asset(
                        'assets/icons/Layers.png',
                      )),
                  IconButton(
                      onPressed: () {
                        onPageChanged(1);
                        navigation(1);
                      },
                      iconSize: 35,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Image.asset(
                        'assets/icons/Verified account.png',
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () {
                        onPageChanged(2);
                        navigation(2);
                      },
                      iconSize: 35,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Image.asset(
                        'assets/icons/People.png',
                      )),
                  IconButton(
                      onPressed: () {
                        onPageChanged(3);
                        navigation(3);
                      },
                      iconSize: 35,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Image.asset(
                        'assets/icons/News.png',
                      )),
                ],
              ),
            ),
            
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
            
            children: const [
              HomeScreen(),
              ProfileScreen(),
              ListFriendScreen(),
              SettingScreen()
            ],
          )),
    );
  }
}
