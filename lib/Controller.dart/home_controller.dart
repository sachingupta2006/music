import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<bool> _playBool = List.generate(5, (index) => false);
  List<bool> get playBool => _playBool;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  final List<Audio> musicPath = [
    Audio("assets/music/ram.mp3",
        metas: Metas(
            id: 'Pop id name',
            title: 'Pop title',
            artist: 'jubin artis name',
            album: 'album name',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
    Audio("assets/music/krishna.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
  ];
}
