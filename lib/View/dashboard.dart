import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/Controller.dart/home_controller.dart';
import 'package:music/Utils/sizebox.dart';
import 'package:music/Utils/text.dart';
import 'package:music/View/music_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeController homeController = Get.put(HomeController());

  late AssetsAudioPlayer assetsAudioPlayer;
  final List<StreamSubscription> subscriptions = [];
  @override
  void initState() {
    super.initState();

    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
      print('playlistAudioFinished : $data');
    }));
    subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
      print('audioSessionId : $sessionId');
    }));
    openPlayer(homeController.musicPath);
  }

  void openPlayer(musicPath) async {
    await assetsAudioPlayer.open(
      Playlist(audios: musicPath, startIndex: 0),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    print('dispose');
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: textBlack25w600('Music')),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () => Get.to(() => const MusicDetails(index: 0)),
                child: textBlack25w600('music Details')),
            StreamBuilder(
              stream: assetsAudioPlayer.current,
              builder: (context, playing) {
                if (playing.data != null) {
                  final myAudio = find(homeController.musicPath,
                      playing.data!.audio.assetAudioPath);
                  print(playing.data!.audio.assetAudioPath);
                  return Padding(
                      padding: const EdgeInsets.all(8),
                      child:
                          homeController.musicPath[0].metas.image?.path == null
                              ? const SizedBox()
                              : Image.asset(
                                  homeController.musicPath[0].metas.image!.path,
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.contain,
                                ));
                }
                return const SizedBox.shrink();
              },
            ),
            ElevatedButton(
                onPressed: () {
                  AssetsAudioPlayer.playAndForget(
                      Audio(homeController.musicPath[2].path),
                      seek: const Duration(seconds: 3));
                },
                child: Icon(Icons.add_alert, color: Colors.grey[800])),
            20.height,
            assetsAudioPlayer.builderCurrent(
              builder: (context, Playing? playing) {
                return Column(
                  children: [
                    assetsAudioPlayer.builderLoopMode(
                      builder: (context, loopMode) {
                        return PlayerBuilder.isPlaying(
                          player: assetsAudioPlayer,
                          builder: (context, isPlaying) {
                            return Slider(
                              min: 0,
                              max: 100,
                              value: 4,
                              onChanged: (value) async {},
                            );
                          },
                        );
                      },
                    ),
                    CircleAvatar(
                      radius: 35,
                      child: IconButton(
                          iconSize: 50,
                          onPressed: () async {
                            AssetsAudioPlayer.playAndForget(
                                Audio(homeController.musicPath[0].path));
                          },
                          icon: Icon(Icons.play_arrow)),
                    ),
                  ],
                );
              },
            ),
            20.height,
            textBlack25w600(homeController.musicPath[1].metas.title.toString()),
            20.height,
          ],
        ));
  }
}
