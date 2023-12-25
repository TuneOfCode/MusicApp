import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app_client/src/constants/router_path.dart';
import 'package:music_app_client/src/modules/playlist/models/playlist_model.dart';
import 'package:music_app_client/src/widgets/add_playlist_modal.dart';
import 'package:music_app_client/src/widgets/bottom_navigation_bar.dart';
import 'package:music_app_client/src/widgets/loading_widget.dart';
import 'package:music_app_client/src/widgets/playlist_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getImage() async {
    var image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = File(image!.path);
      debugPrint('====> image path upload: $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hồ sơ',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: _image == null
                              ? const AssetImage(
                                  'assets/images/login_music_icon.webp')
                              : FileImage(_image!) as ImageProvider,
                        ),
                        Positioned(
                          bottom: -8,
                          right: 0,
                          child: IconButton(
                            onPressed: getImage,
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 12,
                      ),
                      child: Text(
                        'Trần Thanh Tú',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(117, 116, 116, 0.251),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Chỉnh sửa trang cá nhân',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext bc) {
                            return const LoadingWidget();
                          },
                        );
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              routers[Paths.login]!,
                              (route) => false,
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(117, 116, 116, 0.251),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Đăng xuất',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Danh sách phát của tôi',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext bc) {
                          return const AddPlaylistModal();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.playlist_add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Playlist.playlists.length,
                  itemBuilder: (context, index) {
                    return PlaylistCardWidget(
                        playlist: Playlist.playlists[index]);
                  },
                ),
                // child: const Center(
                //   child: Text(
                //     'Danh sách phát trống',
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentIndex: 3,
      ),
    );
  }
}
