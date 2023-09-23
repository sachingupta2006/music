import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  // late AssetsAudioPlayer assetsAudioPlayer;
  // final List<StreamSubscription> subscriptions = [];
  // @override
  // void initState() {
  //   super.initState();

  //   assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
  //   subscriptions.add(assetsAudioPlayer.playlistAudioFinished.listen((data) {
  //     print('playlistAudioFinished : $data');
  //   }));
  //   subscriptions.add(assetsAudioPlayer.audioSessionId.listen((sessionId) {
  //     print('audioSessionId : $sessionId');
  //   }));
  //   openPlayer(homeController.musicPath);
  // }

  // void openPlayer(musicPath) async {
  //   await assetsAudioPlayer.open(
  //     Playlist(audios: musicPath, startIndex: 0),
  //     showNotification: true,
  //     autoStart: true,
  //   );
  // }

  // @override
  // void dispose() {
  //   assetsAudioPlayer.dispose();
  //   super.dispose();
  // }

  // Audio find(List<Audio> source, String fromPath) {
  //   return source.firstWhere((element) => element.path == fromPath);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: textBlack25w600('Music')),
        body: GetBuilder<HomeController>(builder: (context) {
          return ListView.builder(
              itemCount: homeController.musicPath.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    15.height,
                    GestureDetector(
                        onTap: () => Get.to(() => MusicDetails(index: index)),
                        child: ListTile(
                          title: textBlack20w600(
                              homeController.musicPath[index].metas.title ??
                                  'No title available'),
                          leading: Image.asset(
                              homeController
                                      .musicPath[index].metas.image?.path ??
                                  'assets/images/img.jpeg',
                              height: 90.h),
                          subtitle: textBlack15w400(
                              homeController.musicPath[index].metas.artist ??
                                  'No artist available'),
                        )),
                    15.height,
                  ],
                );
              });
        }));
  }
}
