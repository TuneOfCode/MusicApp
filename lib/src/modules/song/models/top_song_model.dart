class TopSong {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  int order;

  TopSong({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
    required this.order,
  });

  static List<TopSong> topSongs = [
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 3,
    ),
    TopSong(
      title: 'Em đây chẳng phải Thuý Kiều',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/IAmNotThuyKieu.mp3',
      coverUrl: 'assets/images/edcptk_img_song.jpg',
      order: 2,
    ),
    TopSong(
      title: 'Không một bài hát nào có thể diễn tả cảm xúc của em lúc này',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/khongmotbaihatcothedientacamxucemlucnay.mp3',
      coverUrl: 'assets/images/kmbh_img_song.jpg',
      order: 1,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 4,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 5,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 6,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 7,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 8,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 9,
    ),
    TopSong(
      title: 'Gieo quẻ',
      description: 'Hoàng Thuỳ Linh',
      url: 'assets/audios/Gieoque.mp3',
      coverUrl: 'assets/images/gieoque_img_song.jpg',
      order: 10,
    ),
  ];
}
