import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/play_buttons.dart';
import 'package:music_app_client/src/widgets/seed_bar.dart';
import 'package:music_app_client/src/widgets/volume_bar.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({
    Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  })  : _seekBarDataStream = seekBarDataStream,
        super(key: key);

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  State<MusicPlayerWidget> createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  late bool _isMute;

  @override
  void initState() {
    super.initState();
    _isMute = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 50.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.song.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            widget.song.description,
            maxLines: 2,
          ),
          const SizedBox(height: 30),
          StreamBuilder<SeekBarData>(
            stream: widget._seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero,
                duration: positionData?.duration ?? Duration.zero,
                onChangeEnd: widget.audioPlayer.seek,
              );
            },
          ),
          PlayerButtonsWidget(
            audioPlayer: widget.audioPlayer,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    _isMute = !_isMute;
                  });

                  if (_isMute) {
                    await widget.audioPlayer.setVolume(0);
                  } else {
                    await widget.audioPlayer.setVolume(0.5);
                  }
                },
                iconSize: 45,
                icon: Icon(
                  _isMute
                      ? Icons.volume_mute_outlined
                      : Icons.volume_up_outlined,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: VolumeBar(
                  audioPlayer: widget.audioPlayer,
                  volume: widget.audioPlayer.volume,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
