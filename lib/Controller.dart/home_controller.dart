import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<bool> _playBool = List.generate(5, (index) => false);
  List<bool> get playBool => _playBool;

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  final List<Audio> musicPath = [
    Audio("assets/music/ai.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
    Audio("assets/music/code-chill.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
    Audio("assets/music/coding-chillstep.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
    Audio("assets/music/coding-night.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
    Audio("assets/music/cyberpunk.mp3",
        metas: Metas(
            id: 'Pop',
            title: 'Pop',
            artist: 'Florent Champigny',
            album: 'PopAlbum',
            image: const MetasImage.asset('assets/images/img.jpeg'))),
  ];
}
