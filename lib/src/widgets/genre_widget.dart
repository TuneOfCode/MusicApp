import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/genre/models/genre_model.dart';
import 'package:music_app_client/src/widgets/genre_card.dart';

class GenreWidget extends StatelessWidget {
  final List<Genre> genres;
  final int length;
  const GenreWidget({super.key, required this.genres, this.length = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       'Thể loại',
          //       style: TextStyle(
          //         fontSize: 25,
          //         // color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       textAlign: TextAlign.left,
          //     ),
          //     InkWell(
          //       child: const Padding(
          //         padding: EdgeInsets.only(
          //           right: 20,
          //         ),
          //         child: Text(
          //           'Khám phá',
          //           style: TextStyle(
          //               // color: Colors.white,
          //               ),
          //           textAlign: TextAlign.left,
          //         ),
          //       ),
          //       onTap: () {},
          //     ),
          //   ],
          // ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (context, index) {
                return GenreCardWidget(genre: genres[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
