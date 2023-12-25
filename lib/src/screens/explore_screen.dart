import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/genre/models/genre_model.dart';
import 'package:music_app_client/src/widgets/bottom_navigation_bar.dart';
import 'package:music_app_client/src/widgets/genre_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Khám phá',
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(
          left: 10,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          children: List.generate(
            Genre.genres.length,
            (index) {
              return GenreCardWidget(genre: Genre.genres[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 1,
      ),
    );
  }
}
