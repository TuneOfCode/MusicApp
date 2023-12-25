import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class VolumeBar extends StatefulWidget {
  final AudioPlayer audioPlayer;
  // const VolumeBar({super.key, required this.audioPlayer});
  final double volume;
  const VolumeBar({super.key, required this.audioPlayer, required this.volume});

  @override
  State<VolumeBar> createState() => _VolumeBarState();
}

class _VolumeBarState extends State<VolumeBar> {
  late double _dragValue;

  @override
  void initState() {
    super.initState();
    // _dragValue = (widget.audioPlayer.volume / 2) * 100;
    _dragValue = widget.volume / 2 * 100;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(
              disabledThumbRadius: 4,
              enabledThumbRadius: 4,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 10,
            ),
            activeTrackColor: Colors.white.withOpacity(0.2),
            inactiveTrackColor: Colors.white,
            thumbColor: Colors.white,
            overlayColor: Colors.white,
          ),
          child: Slider(
            min: 0,
            max: 100,
            value: _dragValue,
            onChanged: (value) async {
              setState(() {
                _dragValue = value;
              });
              await widget.audioPlayer.setVolume(_dragValue / 100);
            },
            activeColor: Colors.red[700],
          ),
        ),
        Text(
          '${_dragValue.round()}%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
