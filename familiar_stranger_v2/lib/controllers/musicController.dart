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

  void initMusic() async {
    for (var e in listMusic) {
      e.select = false;
      e.isPlay = false;
    }
    listMusicSelected = [].obs;
  }

  void selectSong(songId) {
    Song song = listMusic.where((e) => e.id == songId).first;
    if(listMusicSelected.contains(song)){
      listMusicSelected.removeWhere((element) => element.id == song.id);
      song.isPlay = false;
      pauseMusic();
    } else {
      listMusicSelected.add(song);
    }
    update(['listMusicSelected']);
  }

  void chooseSongToPlay(songId){
    Song song = listMusic.where((e) => e.id == songId).first;
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
    playMusic(songId);
    song.isPlay = true;

    // musicController.listMusicSelected.elementAt(index).isPlay 
    // = !musicController.listMusicSelected.elementAt(index).isPlay;
  }

  void playMusic(songId) async {
    Song song = listMusic.where((e) => e.id == songId).first;
    const urlDefault = "https://sendeyo.com/updownload/file/script/112efe41be23536713ea2dba6081917a.mp3";
    await audioPlayer.play(song.musicUrl ?? urlDefault, volume: 80);
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
