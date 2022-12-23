import 'package:audioplayers/audioplayers.dart';
import 'package:familiar_stranger_v2/models/song.dart';
import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  RxList listMusic = [].obs;
  RxList listMusicSelected = [].obs;
  RxBool isPlaying = false.obs;
  RxBool isLoop = false.obs;
  RxBool isRandom = false.obs;
  var audioPlayer = AudioPlayer();

  void loadInitMusic() async {
    listMusic = [].obs;
    await getAllSong();
  }

  void selectSong(song) {
    if(listMusicSelected.contains(song)){
      listMusicSelected.removeWhere((element) => element.id == song.id);
      song.isPlay = false;
      pauseMusic();
    } else {
      listMusicSelected.add(song);
    }
    update(['listMusicSelected']);
  }

  void chooseSongToPlay(song){
    //pause case
    if(song.isPlay == true){
      song.isPlay = false;
      pauseMusic();
      return;
    }

    //
    for (var element in musicController.listMusicSelected) {
      element.isPlay = false;
    }
    playMusic(song);
    song.isPlay = true;

    // musicController.listMusicSelected.elementAt(index).isPlay 
    // = !musicController.listMusicSelected.elementAt(index).isPlay;
  }

  void playMusic(song) async {
    await audioPlayer.play(song.musicUrl, volume: 80);
    song.isPlay = true;
    if(isPlaying == false.obs) {
      isPlaying.toggle();
    }
  }

  void pauseMusic() async {
    for (var element in musicController.listMusicSelected) {
      element.isPlay = false;
    }
    await audioPlayer.pause();
    if(isPlaying == true.obs){
      isPlaying.toggle();
    }
  }

  void loopMusic() {
    isLoop.toggle();
  }

  void randomMusic() {
    isRandom.toggle();
  }
}
