import 'package:audioplayers/audioplayers.dart';
import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:familiar_stranger_v2/controllers/musicController.dart';
import 'package:familiar_stranger_v2/services/socketio.dart';
import 'package:familiar_stranger_v2/ui/components/backgrounds/music_bg.dart';
import 'package:familiar_stranger_v2/ui/components/widgets/buttons/round_button.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/music/widgets/option_music.dart';
import 'package:familiar_stranger_v2/ui/screens/chat/music/widgets/selected_music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final MusicController musicController = Get.put(MusicController());

  String titleMusic = 'Title';
  String author = 'Author';
  bool isSelectedList = true;
  bool isAllList = false;

  @override
  Widget build(BuildContext context) {
    
    var choosedSong = musicController.listMusic.elementAt(0);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Media',
              style: TextStyle(
                  color: primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
        ),
        body: Stack(children: [
          Positioned(
              top: 70,
              left: 0,
              child: SizedBox(
                  // height: 300,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/Vector.png',
                    fit: BoxFit.fill,
                  ))),
          SingleChildScrollView(
            child: MusicBG(
                child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0 * size.width / 414),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70 * size.height / 896,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 150 * size.height / 896,
                        width: 150 * size.height / 896,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(45.0)),
                          color: secondaryText,
                        ),
                        child: const Text(
                          'Streaming',
                          style: TextStyle(color: primaryText, fontSize: 17),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 150 * size.height / 896,
                        width: 150 * size.height / 896,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(45.0)),
                          color: secondaryColor,
                        ),
                        child: const Text(
                          'Character',
                          style: TextStyle(color: secondaryText, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80 * size.height / 896,
                  ),
                  Text(
                    titleMusic,
                    style:
                        const TextStyle(fontFamily: 'NewRocker', fontSize: 18),
                  ),
                  SizedBox(
                    height: 15 * size.height / 896,
                  ),
                  SizedBox(
                    height: 100 * size.height / 896,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //loop
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/Rotate.png',
                              scale: 3,
                            ),
                          ),
                        ),
                        //back
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/LeftButton.png',
                              scale: 3,
                            ),
                          ),
                        ),
                        //play
                        Obx(() {
                          if (musicController.isPlaying == false) {
                            return GestureDetector(
                              onTap: () async {
                                play(choosedSong.id);
                                musicController.playMusic(choosedSong.id);
                                setState(() {});
                              },
                              child: Container(
                                height: 80 * size.height / 896,
                                width: 80 * size.height / 896,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200)),
                                  color: secondaryColor,
                                ),
                                child: Image.asset(
                                  'assets/icons/Play.png',
                                  scale: 3,
                                ),
                              ),
                            );
                          } else {
                            //play == true
                            return GestureDetector(
                              onTap: () async {
                                pause();
                                musicController.pauseMusic();
                                setState(() {});
                              },
                              child: Container(
                                height: 80 * size.height / 896,
                                width: 80 * size.height / 896,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200)),
                                  color: secondaryColor,
                                ),
                                child: Image.asset(
                                  'assets/icons/Pause.png',
                                  scale: 3,
                                ),
                              ),
                            );
                          }
                        }),
                        //next
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/RightButton.png',
                              scale: 3,
                            ),
                          ),
                        ),
                        //random
                        SizedBox(
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/icons/MicrosoftMixer.png',
                              scale: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8 * size.height / 896,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                        borderColor: isSelectedList == true
                            ? fieldColor
                            : secondaryColor,
                        backgroundColor: isSelectedList == true
                            ? secondaryColor
                            : fieldColor,
                        textColor: isSelectedList == true
                            ? secondaryText
                            : primaryText,
                        text: 'Select',
                        press: () {
                          setState(() {
                            isSelectedList = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 8 * size.width / 414,
                      ),
                      RoundButton(
                        borderColor: isSelectedList == false
                            ? fieldColor
                            : secondaryColor,
                        backgroundColor: isSelectedList == false
                            ? secondaryColor
                            : fieldColor,
                        textColor: isSelectedList == false
                            ? secondaryText
                            : primaryText,
                        text: 'All',
                        press: () {
                          setState(() {
                            isSelectedList = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10 * size.height / 896,
                  ),
                  //Music Container
                  Container(
                    height: 369 * size.height / 896,
                    width: 318 * size.width / 414,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20 * size.width / 414),
                    decoration: BoxDecoration(
                        color: secondaryText,
                        border: Border.all(color: fieldBorder, width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    child: (isSelectedList == true)
                        ? Obx(() => ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: musicController.listMusicSelected.length,
                            itemBuilder: (_, index) {
                              return SelectedMusic(
                                  index: index + 1,
                                  name: musicController.listMusicSelected
                                      .elementAt(index)
                                      .title,
                                  press: () async {
                                    choosedSong = musicController.listMusicSelected.elementAt(index);
                                    musicController.chooseSongToPlay(musicController.listMusicSelected.elementAt(index).id);
                                    chooseSong(musicController.listMusicSelected.elementAt(index).id);
                                    setState(() {
                                      titleMusic = choosedSong.title;
                                    });
                                  },
                                  isPlay: musicController.listMusicSelected.elementAt(index).isPlay);
                            }))
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: musicController.listMusic.length,
                            itemBuilder: (_, index) {
                              return OptionMusic(
                                  index: index + 1,
                                  name: musicController.listMusic.elementAt(index).title,
                                  press: () {
                                    musicController.selectSong(musicController.listMusic.elementAt(index).id);
                                    select(musicController.listMusic.elementAt(index).id);
                                    setState(() {
                                      musicController.listMusic.elementAt(index).select 
                                      = !musicController.listMusic.elementAt(index).select;
                                    });
                                  },
                                  isSelected: musicController.listMusic.elementAt(index).select);
                            }),
                  ),
                ],
              ),
            )),
          ),
        ]),
      ),
    );
  }
}
