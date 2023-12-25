import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/genre/models/genre_model.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/bottom_navigation_bar.dart';
import 'package:music_app_client/src/widgets/genre_widget.dart';
import 'package:music_app_client/src/widgets/search_box_autocomplete.dart';
import 'package:music_app_client/src/widgets/trending.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Genre> genres = Genre.genres;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/login_music_icon.webp'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: const Text(
                'Thế giới âm nhạc',
                style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sunny, // FontAwesomeIcons.moon
              color: Colors.yellow,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBoxAutocompleteWidget(),
              GenreWidget(
                genres: genres,
              ),
              TrendingWidget(
                songs: songs,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 0,
      ),
    );
  }
}
