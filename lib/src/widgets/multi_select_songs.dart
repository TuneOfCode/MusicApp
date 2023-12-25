import 'package:flutter/material.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/input_form.dart';

class MultiSelectSongsWidget extends StatefulWidget {
  final List<Song> songs;
  const MultiSelectSongsWidget({
    Key? key,
    required this.songs,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectSongsWidgetState();
}

class _MultiSelectSongsWidgetState extends State<MultiSelectSongsWidget> {
  List<Song> _songs = [];
  List<Song> _selectedItems = [];
  bool _isCheckedAll = false;

  @override
  void initState() {
    _songs = List.from(widget.songs);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _itemChange(Song itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  void _selectAll() {
    setState(() {
      _isCheckedAll = true;
    });
    _selectedItems = List.from(widget.songs);
  }

  void _removeAll() {
    _selectedItems.clear();
    setState(() {
      _isCheckedAll = false;
    });
  }

  void _searchSong(String searchValue) {
    Future.delayed(
        const Duration(
          seconds: 1,
        ), () {
      setState(() {
        if (searchValue.isEmpty) {
          _songs = widget.songs;
        } else {
          _songs = widget.songs
              .where((Song s) => s.title
                  .toLowerCase()
                  .trim()
                  .contains(searchValue.toLowerCase().trim()))
              .toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          const Text('Danh sách nhạc'),
          InputFormWidget(
            hintText: 'Tìm kiếm bài hát...',
            boderRadius: 10,
            padding: 15,
            prefixIcon: const Icon(
              Icons.search,
              size: 25,
            ),
            onChanged: _searchSong,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: _selectAll,
                  child: const Text('Chọn tất cả'),
                ),
                ElevatedButton(
                  onPressed: _removeAll,
                  child: const Text('Xoá tất cả'),
                ),
              ],
            ),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ListBody(
              children: _songs
                  .map((song) => CheckboxListTile(
                        value: _selectedItems.contains(song),
                        title: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                song.coverUrl,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  song.title,
                                  maxLines: 5,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // subtitle: Text(
                        //   song.description,
                        //   maxLines: 3,
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        // ),
                        selected: _isCheckedAll,
                        controlAffinity: ListTileControlAffinity.trailing,
                        onChanged: (isChecked) => _itemChange(song, isChecked!),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Huỷ bỏ'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Chấp nhận'),
        ),
      ],
    );
  }
}
