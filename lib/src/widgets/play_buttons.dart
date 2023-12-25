import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app_client/src/helpers/lyric_cubit.dart';

class PlayerButtonsWidget extends StatefulWidget {
  const PlayerButtonsWidget({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  State<PlayerButtonsWidget> createState() => _PlayerButtonsWidgetState();
}

class _PlayerButtonsWidgetState extends State<PlayerButtonsWidget> {
  late bool _isEnableLyrics;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.play();
    _isEnableLyrics = false;
  }

  @override
  void dispose() {
    // widget.audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _isEnableLyrics = !_isEnableLyrics;
              context.read<LyricCubit>().enableLyrics();
            });
          },
          iconSize: 45,
          icon: Icon(
            Icons.mic_external_on_outlined,
            color: _isEnableLyrics ? Colors.red[700] : Colors.white,
          ),
        ),
        StreamBuilder<SequenceState?>(
          stream: widget.audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: widget.audioPlayer.hasPrevious
                  ? widget.audioPlayer.seekToPrevious
                  : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!widget.audioPlayer.playing) {
                return IconButton(
                  onPressed: widget.audioPlayer.play,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: widget.audioPlayer.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 75.0,
                  onPressed: () => widget.audioPlayer.seek(
                    Duration.zero,
                    index: widget.audioPlayer.effectiveIndices!.first,
                  ),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: widget.audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: widget.audioPlayer.hasNext
                  ? widget.audioPlayer.seekToNext
                  : null,
              iconSize: 45,
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
            );
          },
        ),
        IconButton(
          onPressed: () {},
          iconSize: 45,
          icon: const Icon(
            Icons.loop_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
