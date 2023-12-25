import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/genre/models/genre_model.dart';

class GenreCardWidget extends StatelessWidget {
  final Genre genre;

  const GenreCardWidget({
    super.key,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(
                    genre.coverUrl,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.2,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.play_circle,
                      color: Colors.red[800],
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    genre.name,
                    style: TextStyle(
                      color: Colors.red[800],
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
