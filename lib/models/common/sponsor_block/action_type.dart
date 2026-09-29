enum ActionType {
  skip('jump over'),
  mute('mute'),
  full('whole video'),
  poi('Highlights'),
  ;

  final String title;
  const ActionType(this.title);
}
