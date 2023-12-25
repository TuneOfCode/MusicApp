import 'package:flutter/material.dart';
import 'package:music_app_client/src/constants/router_path.dart';
import 'package:music_app_client/src/screens/explore_screen.dart';
import 'package:music_app_client/src/screens/home_screen.dart';
import 'package:music_app_client/src/screens/login_screen.dart';
import 'package:music_app_client/src/screens/playlist_screen.dart';
import 'package:music_app_client/src/screens/profile_screen.dart';
import 'package:music_app_client/src/screens/rank_screen.dart';
import 'package:music_app_client/src/screens/register_screen.dart';
import 'package:music_app_client/src/screens/song_screen.dart';

final Map<String, Widget Function(BuildContext)> configRouters = {
  routers[Paths.home]!: (_) => const HomeScreen(),
  routers[Paths.login]!: (_) => const LoginScreen(),
  routers[Paths.register]!: (_) => const RegisterScreen(),
  routers[Paths.explore]!: (_) => const ExploreScreen(),
  routers[Paths.rank]!: (_) => const RankScreen(),
  routers[Paths.profile]!: (_) => const ProfileScreen(),
  routers[Paths.song]!: (_) => const SongScreen(),
  routers[Paths.playlist]!: (_) => const PlaylistScreen(),
};
