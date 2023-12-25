import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/song_card.dart';

class TrendingWidget extends StatelessWidget {
  final List<Song> songs;
  const TrendingWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Nổi bật',
                style: TextStyle(
                  fontSize: 25,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    'Xem thêm',
                    style: TextStyle(
                        // color: Colors.white,
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCardWidget(song: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
