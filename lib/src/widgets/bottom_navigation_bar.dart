import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app_client/src/constants/router_path.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavigationBarWidget({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.red,
      // showUnselectedLabels: false,
      // showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.explore_outlined,
          ),
          label: 'Khám phá',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.chartLine,
          ),
          label: 'Bảng xếp hạng',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
          ),
          label: 'Hồ sơ',
        ),
      ],
      onTap: (value) {
        if (value == currentIndex) return;
        switch (value) {
          case 0:
            Navigator.pushNamedAndRemoveUntil(
              context,
              routers[Paths.home]!,
              (route) => false,
            );
            break;
          case 1:
            Navigator.pushNamedAndRemoveUntil(
              context,
              routers[Paths.explore]!,
              (route) => false,
            );
            break;
          case 2:
            Navigator.pushNamedAndRemoveUntil(
              context,
              routers[Paths.rank]!,
              (route) => false,
            );
            break;
          case 3:
            Navigator.pushNamedAndRemoveUntil(
              context,
              routers[Paths.profile]!,
              (route) => false,
            );
            break;
        }
      },
      currentIndex: currentIndex,
    );
  }
}
