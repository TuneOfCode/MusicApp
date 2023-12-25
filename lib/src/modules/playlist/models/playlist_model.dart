import 'package:music_app_client/src/modules/song/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
      title: 'Tổng hợp bài hát về Hip-hop',
      songs: Song.songs,
      imageUrl: 'assets/images/bg_hiphop.jpg',
    ),
    Playlist(
      title: 'Tổng hợp bài hát về Rock',
      songs: Song.songs,
      imageUrl: 'assets/images/bg_rock.jpg',
    ),
    Playlist(
      title: 'Tổng hợp bài hát về Rap',
      songs: Song.songs,
      imageUrl: 'assets/images/bg_rap.jpg',
    ),
    Playlist(
      title: 'Tổng hợp bài hát về EDM',
      songs: Song.songs,
      imageUrl: 'assets/images/bg_edm.jpg',
    ),
    Playlist(
      title: 'Tổng hợp bài hát về V-Pop',
      songs: Song.songs,
      imageUrl: 'assets/images/bg_v-pop.jpg',
    ),
  ];
}
