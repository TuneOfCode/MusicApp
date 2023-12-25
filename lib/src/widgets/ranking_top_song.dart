import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/song/models/top_song_model.dart';
import 'package:music_app_client/src/widgets/ranking_top_song_item.dart';

class RankingTopSongWidget extends StatelessWidget {
  const RankingTopSongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TopSong> topSongs = TopSong.topSongs;
    topSongs.sort((a, b) => a.order.compareTo(b.order));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: topSongs.length,
            itemBuilder: ((context, index) {
              return RankingTopSongItemWidget(topSong: topSongs[index]);
            }),
          ),
        ],
      ),
    );
  }
}
