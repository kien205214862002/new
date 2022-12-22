import 'package:familiar_stranger_v2/services/api.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  RxList listMusic = [].obs;

  void loadInitMusic() async {
    await getAllSong();
  }
}