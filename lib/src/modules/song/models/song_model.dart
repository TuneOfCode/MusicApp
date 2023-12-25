class Song {
  final int id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      id: 1,
      title: 'Gieo quẻ',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/GieoQue.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
    ),
    Song(
      id: 2,
      title: 'Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 3,
      title: 'Không một bài hát nào có thể diễn tả cảm xúc của em lúc này',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/khongmotbaihatcothedientacamxucemlucnay.mp3',
      coverUrl: 'assets/images/kmbh_img_song.jpg',
    ),
    Song(
      id: 4,
      title: 'Một Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 5,
      title: 'Hai Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 6,
      title: 'Ba Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 7,
      title: 'Bốn Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 8,
      title: 'Năm Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 9,
      title: 'Sáu Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
    Song(
      id: 10,
      title: 'Bảy Em đây chẳng phải Thuý Kiều',
      description: 'ca sĩ Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
    ),
  ];
}
