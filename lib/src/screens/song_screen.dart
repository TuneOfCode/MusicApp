import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lyric/lyric_ui/ui_netease.dart';
import 'package:flutter_lyric/lyrics_model_builder.dart';
import 'package:flutter_lyric/lyrics_reader_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app_client/src/constants/lyric.dart';
import 'package:music_app_client/src/helpers/lyric_cubit.dart';
import 'package:music_app_client/src/modules/playlist/models/playlist_model.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/playlist_songs.dart';
import 'package:music_app_client/src/widgets/seed_bar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../widgets/music_player.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Playlist playlist = Playlist.playlists[0];
  Song song = Song.songs[2];
  final LyricCubit _lyricCubit = LyricCubit(false);

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(
      initialIndex: 2,
      ConcatenatingAudioSource(
        shuffleOrder: DefaultShuffleOrder(),
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
          ),
          AudioSource.uri(
            Uri.parse('asset:///${Song.songs[2].url}'),
          ),
        ],
      ),
    );
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      }).asBroadcastStream();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (_) => _lyricCubit,
        child: BlocBuilder(
          bloc: _lyricCubit,
          builder: (BuildContext context, bool state) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Image.asset(
                        song.coverUrl,
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation<double>(0.8),
                      ),
                      ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.0),
                              ],
                              stops: const [
                                0.0,
                                0.4,
                                0.6
                              ]).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue.shade300,
                                Colors.blue.shade600,
                                Colors.blue.shade800,
                              ],
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<SeekBarData>(
                        stream: _seekBarDataStream,
                        builder: (context, snapshot) {
                          if (!state) {
                            return Container();
                          }
                          return LyricsReader(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            model: LyricsModelBuilder.create()
                                .bindLyricToMain(normalLyric)
                                .getModel(),
                            position: snapshot.data!.position.inMilliseconds,
                            lyricUi: UINetease(),
                            playing: true,
                            size: Size(
                              double.infinity,
                              MediaQuery.of(context).size.height / 2,
                            ),
                            emptyBuilder: () => Center(
                              child: Text(
                                "Không có lời",
                                style: UINetease().getOtherMainTextStyle(),
                              ),
                            ),
                            selectLineBuilder: (progress, confirm) {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      confirm.call();
                                      setState(() {
                                        if (!audioPlayer.playing) {
                                          audioPlayer.play();
                                        }
                                        audioPlayer.seek(
                                          Duration(
                                            milliseconds: progress,
                                          ),
                                        );
                                      });
                                    },
                                    icon: const Icon(Icons.play_arrow,
                                        color: Colors.white),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      height: 1,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Text(
                                    progress.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                      MusicPlayerWidget(
                        song: song,
                        seekBarDataStream: _seekBarDataStream,
                        audioPlayer: audioPlayer,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.shade800,
                        Colors.blue.shade800,
                        Colors.blue.shade800,
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
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
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: playlist.songs.length,
                          itemBuilder: ((context, index) {
                            return PlaylistSongsWidget(
                              song: playlist.songs[index],
                              isActive: index == 1,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
