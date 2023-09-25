import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music/Controller.dart/home_controller.dart';
import 'package:music/Utils/sizebox.dart';
import 'package:music/Utils/text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicDetails extends StatelessWidget {
  const MusicDetails({super.key, required this.data});
  final List<SongModel> data;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: [
                20.height,
                SizedBox(
                    height: 250.h,
                    width: 250.w,
                    child: QueryArtworkWidget(
                      id: data[homeController.playIndex.value].id,
                      type: ArtworkType.AUDIO,
                      artworkHeight: double.infinity,
                      artworkWidth: double.infinity,
                      nullArtworkWidget:
                          Image.asset('assets/images/img.jpeg', height: 250.h),
                    )),
                10.height,
                textBlack20w600(
                    data[homeController.playIndex.value].displayNameWOExt),
                10.height,
                textBlack15w400(
                    data[homeController.playIndex.value].artist.toString()),
                10.height,
                Row(children: [
                  textBlack15w400(homeController.position.value),
                  Expanded(
                    child: Slider(
                      value: homeController.value.value,
                      min: 0.0,
                      max: homeController.max.value,
                      onChanged: (newValue) {
                        homeController
                            .changeDurationToSeconds(newValue.toInt());
                        newValue = newValue;
                      },
                    ),
                  ),
                  textBlack15w400(homeController.duration.value)
                ]),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          homeController.playSong(
                              data[homeController.playIndex.value - 1].uri,
                              homeController.playIndex.value - 1);
                        },
                        icon: Icon(Icons.skip_previous,
                            size: 40.sp, color: Colors.grey[800])),
                    CircleAvatar(
                      radius: 35.sp,
                      child: IconButton(
                          onPressed: () {
                            if (homeController.isPlaying.value) {
                              homeController.audioPlayer.pause();
                            } else {
                              homeController.audioPlayer.play();
                            }
                            homeController.isPlaying.value =
                                !homeController.isPlaying.value;
                          },
                          icon: Icon(
                              homeController.isPlaying.value
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 54.sp,
                              color: Colors.grey[800])),
                    ),
                    IconButton(
                        onPressed: () {
                          homeController.playSong(
                              data[homeController.playIndex.value + 1].uri,
                              homeController.playIndex.value + 1);
                        },
                        icon: Icon(Icons.skip_next,
                            size: 40.sp, color: Colors.grey[800])),
                  ],
                ),
                20.height,
              ],
            ),
          ),
        ));
  }
}
