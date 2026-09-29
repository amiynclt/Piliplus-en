enum EpisodeType {
  part('Point P'),
  season('Collection'),
  pgc('drama series'),
  ;

  final String title;
  const EpisodeType(this.title);
}
