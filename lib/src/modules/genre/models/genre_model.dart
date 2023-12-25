class Genre {
  final String name;
  final String coverUrl;

  Genre({
    required this.name,
    required this.coverUrl,
  });

  static List<Genre> genres = [
    Genre(
      name: 'Pop',
      coverUrl: 'assets/images/bg_pop.jpg',
    ),
    Genre(
      name: 'Rock',
      coverUrl: 'assets/images/bg_rock.jpg',
    ),
    Genre(
      name: 'EDM',
      coverUrl: 'assets/images/bg_edm.jpg',
    ),
    Genre(
      name: 'Hip hop',
      coverUrl: 'assets/images/bg_hiphop.jpg',
    ),
    Genre(
      name: 'Rap',
      coverUrl: 'assets/images/bg_rap.jpg',
    ),
    Genre(
      name: 'US-UK',
      coverUrl: 'assets/images/bg_us-uk.jpeg',
    ),
    Genre(
      name: 'V-Pop',
      coverUrl: 'assets/images/bg_v-pop.jpg',
    ),
    Genre(
      name: 'K-Pop',
      coverUrl: 'assets/images/bg_k-pop.jpg',
    ),
  ];
}
