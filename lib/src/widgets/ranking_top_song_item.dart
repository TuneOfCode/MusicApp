import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/song/models/top_song_model.dart';

class RankingTopSongItemWidget extends StatelessWidget {
  final TopSong topSong;
  const RankingTopSongItemWidget({
    super.key,
    required this.topSong,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTop1 = topSong.order == 1;
    final bool isTop2 = topSong.order == 2;
    final bool isTop3 = topSong.order == 3;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade800.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                right: 10,
              ),
              child: Text(
                topSong.order < 10 ? '0${topSong.order}' : '${topSong.order}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: isTop1
                      ? Colors.blue[600]
                      : (isTop2
                          ? Colors.green[600]
                          : isTop3
                              ? Colors.red[600]
                              : Colors.white),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                topSong.coverUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      topSong.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      topSong.description,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
