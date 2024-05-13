class Game {
  final int id;
  final String title;
  final String platform;
  final DateTime releaseDate;
  final String description;
  final double userRating;
  final String userComment;

  Game({
    required this.id,
    required this.title,
    required this.platform,
    required this.releaseDate,
    required this.description,
    required this.userRating,
    required this.userComment,
  });

  @override
  String toString() {
    return "<Game: $title, Platform: $platform, Release Date: $releaseDate, Rating: $userRating, Comment: $userComment>";
  }
}
