import 'package:flutter/material.dart';
import 'package:music_app_client/src/widgets/bottom_navigation_bar.dart';
import 'package:music_app_client/src/widgets/chart_song.dart';
import 'package:music_app_client/src/widgets/ranking_top_song.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  RankScreenState createState() => RankScreenState();
}

class RankScreenState extends State<RankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bảng xếp hạng'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //Initialize the chart widget
            ChartSongWidget(),
            RankingTopSongWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 2,
      ),
    );
  }
}
