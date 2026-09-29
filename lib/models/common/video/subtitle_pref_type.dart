enum SubtitlePrefType {
  off('Subtitles are not displayed by default'),
  on('Prefer non-automatically generated (ai) subtitles'),
  withoutAi('Skip automatically generated (ai) subtitles and choose the first available subtitle'),
  auto('When muted, it is equivalent to the second item, and when it is not muted, it is equivalent to the third item.'),
  ;

  final String desc;
  const SubtitlePrefType(this.desc);
}
