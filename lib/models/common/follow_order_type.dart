enum FollowOrderType {
  def('', 'Recently followed'),
  attention('attention', 'most visited'),
  ;

  final String type;
  final String title;

  const FollowOrderType(this.type, this.title);
}
