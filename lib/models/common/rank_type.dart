enum RankType {
  all('Whole site', rid: 0),
  anime('Fan drama', seasonType: 1),
  guochuang('Guochuang', seasonType: 4),
  douga('animation', rid: 1005),
  music('music', rid: 1003),
  dance('dance', rid: 1004),
  game('game', rid: 1008),
  knowledge('Knowledge', rid: 1010),
  tech('science and technology', rid: 1012),
  sports('sports', rid: 1018),
  car('car', rid: 1013),
  food('gourmet food', rid: 1020),
  animal('animal', rid: 1024),
  kichiku('Ghost beast', rid: 1007),
  fashion('Fashion', rid: 1014),
  ent('entertainment', rid: 1002),
  cinephile('Film and television', rid: 1001),
  documentary('Record', seasonType: 3),
  movie('Movie', seasonType: 2),
  tv('drama series', seasonType: 5),
  variety('variety show', seasonType: 7),
  ;

  final String label;
  final int? rid;
  final int? seasonType;
  const RankType(this.label, {this.rid, this.seasonType});
}
