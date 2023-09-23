import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/Controller.dart/home_controller.dart';
import 'package:music/Utils/sizebox.dart';
import 'package:music/Utils/text.dart';

class MusicDetails extends StatefulWidget {
const  MusicDetails({super.key, required this.index});
  final int index;

  @override
  State<MusicDetails> createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
  late AssetsAudioPlayer assetsAudioPlayer;
  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: textBlack25w600('Music')),
      body: Column(children: [
        // StreamBuilder(
        //   stream: assetsAudioPlayer.current,
        //   builder: (context, playing) {
        //     if (playing.data != null) {
        //       final myAudio = homeController.find(
        //           homeController.musicPath, playing.data!.audio.assetAudioPath);
        //       print(playing.data!.audio.assetAudioPath);
        //       return Padding(
        //           padding: const EdgeInsets.all(8),
        //           child: homeController
        //                       .musicPath[widget.index].metas.image?.path ==
        //                   null
        //               ? const SizedBox()
        //               : Image.asset(
        //                   homeController
        //                       .musicPath[widget.index].metas.image!.path,
        //                   height: 150,
        //                   width: 150,
        //                   fit: BoxFit.contain,
        //                 ));
        //     }
        //     return const SizedBox.shrink();
        //   },
        // ),
        ElevatedButton(
            onPressed: () {
              assetsAudioPlayer.open(
                  Audio.file(homeController.musicPath[widget.index].path));
            },
            child: Icon(Icons.add_alert, color: Colors.grey[800])),
        20.height,
      ]),
    );
  }
}
