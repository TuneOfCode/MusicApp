import 'package:flutter/material.dart';
import 'package:music_app_client/src/constants/router_path.dart';
import 'package:music_app_client/src/modules/song/models/song_model.dart';
import 'package:music_app_client/src/widgets/input_form.dart';

class SearchBoxAutocompleteWidget extends StatelessWidget {
  const SearchBoxAutocompleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Song>(
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onFieldSubmitted,
      ) {
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: InputFormWidget(
            controller: textEditingController,
            // onEditingComplete: onFieldSubmitted,
            focusNode: focusNode,
            hintText: 'Tìm kiếm tên bài hát, thể loại, nghệ sĩ...',
            boderRadius: 10,
            padding: 15,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            isFilled: true,
            fillColor: Colors.grey[800],
            borderColor: Colors.transparent,
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<Song>.empty();
        }
        return Song.songs.where((Song song) {
          return song.title
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      displayStringForOption: (song) => song.title,
      onSelected: (Song selection) {
        debugPrint('--> You just selected ${selection.title}');
      },
      optionsViewBuilder: (
        context,
        Function(Song) onSelected,
        Iterable<Song> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                      debugPrint("chọn:::${option.title}");
                      Navigator.pushNamed(
                        context,
                        routers[Paths.song]!,
                      );
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          option.coverUrl,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        option.title,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
