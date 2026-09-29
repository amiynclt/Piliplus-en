enum VideoPubTimeType {
  all('No limit'),
  day('last day'),
  week('last week'),
  halfYear('last six months'),
  ;

  final String label;
  const VideoPubTimeType(this.label);
}

enum VideoDurationType {
  all('full duration'),
  tenMins('0-10 minutes'),
  halfHour('10-30 minutes'),
  hour('30-60 minutes'),
  hourPlus('60 minutes+'),
  ;

  final String label;
  const VideoDurationType(this.label);
}

enum VideoZoneType {
  all('all'),
  douga('animation', tids: 1),
  anime('Fan drama', tids: 13),
  guochuang('Guochuang', tids: 167),
  music('music', tids: 3),
  dance('dance', tids: 129),
  game('game', tids: 4),
  knowledge('Knowledge', tids: 36),
  tech('science and technology', tids: 188),
  sports('sports', tids: 234),
  car('car', tids: 223),
  life('Life', tids: 160),
  food('gourmet food', tids: 221),
  animal('animal', tids: 217),
  kichiku('Ghost beast', tids: 119),
  fashion('Fashion', tids: 115),
  info('Information', tids: 202),
  ent('entertainment', tids: 5),
  cinephile('Film and television', tids: 181),
  documentary('Record', tids: 177),
  movie('Movie', tids: 23),
  tv('television', tids: 11),
  ;

  final String label;
  final int? tids;
  const VideoZoneType(this.label, {this.tids});
}

// 搜索类型为视频、专栏及相簿时
enum ArchiveFilterType {
  totalrank('Default sort'),
  click('play more'),
  pubdate('New release'),
  dm('Too many barrages'),
  stow('Many collections'),
  scores('Many comments'),
  ;

  // 专栏
  // attention('Most Liked'),

  final String desc;
  const ArchiveFilterType(this.desc);
}
