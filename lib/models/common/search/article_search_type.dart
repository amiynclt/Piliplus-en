enum ArticleOrderType {
  totalrank('Comprehensive sorting'),
  pubdate('Latest releases'),
  click('Most clicks'),
  attention('Most Liked'),
  scores('Most comments'),
  ;

  String get order => name;
  final String label;
  const ArticleOrderType(this.label);
}

enum ArticleZoneType {
  all('All partitions', 0),
  douga('animation', 2),
  game('game', 1),
  cinephile('Film and television', 28),
  life('Life', 3),
  interest('interest', 29),
  novel('light novel', 16),
  tech('science and technology', 17),
  note('notes', 41),
  ;

  final String label;
  final int categoryId;
  const ArticleZoneType(this.label, this.categoryId);
}
