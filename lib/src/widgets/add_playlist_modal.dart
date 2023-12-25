import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/input_form.dart';
import 'package:music_app_client/src/widgets/multi_select_songs.dart';

class AddPlaylistModal extends StatefulWidget {
  final bool isEdit;
  const AddPlaylistModal({super.key, this.isEdit = false});

  @override
  State<AddPlaylistModal> createState() => _AddPlaylistModalState();
}

class _AddPlaylistModalState extends State<AddPlaylistModal> {
  File? _image;
  final ImagePicker picker = ImagePicker();
  List<Song> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  void _showMultiSelect() async {
    final List<Song>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectSongsWidget(
          songs: Song.songs,
        );
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
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
      debugPrint('====> image path upload: ${image.path}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.isEdit ? "Cập nhật danh sách phát" : "Thêm danh sách phát",
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 10),
              if (!widget.isEdit) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: _image == null
                      ? Image.asset(
                          'assets/images/bg_edm.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                ),
                IconButton(
                  onPressed: getImage,
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  ),
                ),
                const InputFormWidget(
                  hintText: 'Tên danh sách phát',
                  boderRadius: 10,
                  padding: 15,
                  prefixIcon: Icon(
                    Icons.playlist_add_check_outlined,
                    size: 25,
                  ),
                ),
              ],
              InputFormWidget(
                hintText: 'Chọn danh sách nhạc',
                boderRadius: 10,
                padding: 15,
                prefixIcon: const Icon(
                  Icons.music_note_outlined,
                  size: 25,
                ),
                suffixIcon: IconButton(
                  onPressed: _showMultiSelect,
                  icon: const Icon(
                    Icons.my_library_music_outlined,
                    size: 25,
                  ),
                ),
                readonly: true,
                controller: TextEditingController(
                  text: _selectedItems
                      .map(
                        (e) => e.title,
                      )
                      .join(', '),
                ),
              ),
              Container(height: 30),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.transparent,
          ),
          onPressed: () {
            Navigator.pop(context); // Close the sheet.
          },
          child: Text("Huỷ bỏ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Tạo mới",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary)),
        )
      ],
    );
  }
}
