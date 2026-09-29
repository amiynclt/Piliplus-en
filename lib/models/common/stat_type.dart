import 'package:material_ui/material_ui.dart' show IconData, Icons;

enum StatType {
  view(Icons.remove_red_eye_outlined, 'watch'),
  danmaku(Icons.subtitles_outlined, 'Barrage'),
  like(Icons.thumb_up_outlined, 'Like'),
  reply(Icons.comment_outlined, 'Comment'),
  follow(Icons.favorite_border, 'focus on'),
  play(Icons.play_circle_outlined, 'play'),
  listen(Icons.headset_outlined, 'play'),
  ;

  final IconData iconData;
  final String label;
  const StatType(this.iconData, this.label);
}
