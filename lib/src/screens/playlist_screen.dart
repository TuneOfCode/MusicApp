import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/playlist/models/playlist_model.dart';
import 'package:music_app_client/src/widgets/add_playlist_modal.dart';
import 'package:music_app_client/src/widgets/playlist_songs.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist playlist = Playlist.playlists[0];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade900.withOpacity(0.8),
            Colors.blue.shade600.withOpacity(0.8),
            Colors.blue.shade300.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text('Danh sách nhạc'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        playlist.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      playlist.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shuffle,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext bc) {
                            return const AddPlaylistModal(
                              isEdit: true,
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.playlist_add_outlined,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlist.songs.length,
                  itemBuilder: ((context, index) {
                    return PlaylistSongsWidget(
                      song: playlist.songs[index],
                      isActive: index == 1,
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
