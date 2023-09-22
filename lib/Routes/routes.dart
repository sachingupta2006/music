import 'package:get/get.dart';
import 'package:music/Routes/routes_name.dart';
import 'package:music/View/dashboard.dart';
import 'package:music/View/music_details.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.dashboard,
            page: () => const Dashboard(),
            transition: Transition.rightToLeft),
        GetPage(
            name: RoutesName.musicDetails,
            page: () => const MusicDetails(),
            transition: Transition.rightToLeft)
      ];
}
