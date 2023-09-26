import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/Controller.dart/home_controller.dart';
import 'package:music/Utils/sizebox.dart';
import 'package:music/Utils/text.dart';
import 'package:music/View/music_details.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textBlack25w600('Music'),
          // actions: [const Icon(Icons.search)],
        ),
        body: FutureBuilder<List<SongModel>>(
          future: homeController.audioQuery.querySongs(
              ignoreCase: true,
              orderType: OrderType.ASC_OR_SMALLER,
              sortType: null,
              uriType: UriType.EXTERNAL),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.isEmpty) {
              return textBlack20w600('No Song Found');
            }
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      15.height,
                      GestureDetector(
                          onTap: () {
                            Get.to(() => MusicDetails(data: snapshot.data!));
                            homeController.playSong(
                                snapshot.data![index].uri, index);
                          },
                          child: Obx(
                            () => ListTile(
                              title: textBlack20w600(
                                  snapshot.data![index].displayNameWOExt),
                              leading: QueryArtworkWidget(
                                id: snapshot.data![index].id,
                                type: ArtworkType.AUDIO,
                                nullArtworkWidget: const Icon(Icons.music_note),
                              ),
                              subtitle: textBlack15w400(
                                  snapshot.data![index].artist ??
                                      'unkown artist'),
                              trailing:
                                  homeController.playIndex.value == index &&
                                          homeController.isPlaying.value
                                      ? const Icon(Icons.play_arrow)
                                      : null,
                            ),
                          )),
                      15.height,
                    ],
                  );
                });
          },
        ));
  }
}
