import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/home_bg.dart';
import 'package:familiar_stranger_v2/ui/screens/friend/widgets/friend_model.dart';
import 'package:flutter/material.dart';

class ListFriendScreen extends StatefulWidget {
  const ListFriendScreen({Key? key}) : super(key: key);

  @override
  State<ListFriendScreen> createState() => _ListFriendScreenState();
}

class _ListFriendScreenState extends State<ListFriendScreen> {
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
                          SizedBox(width: 50*size.width/414,), 
                          SizedBox(
                            height: 50*size.height/896,
                            width: 163*size.width/414,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              initialValue: 'Search...',
                              style: const TextStyle(fontSize: 16),
                              onChanged: (value){
                                // print(value);
                              },
                            ),
                          ),
                          SizedBox(width: 10*size.width/414,),
                          GestureDetector(
                            onTap: (){},
                            child: Image.asset('assets/icons/FindingUser.png', scale: 3,),
                          ),
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
                          itemCount: 50,
                          itemBuilder: (_, index){
                            return FriendModel(friendName: '${index+1}');
                          }, 
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10*size.height/896,);
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
