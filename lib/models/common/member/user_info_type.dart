import 'package:material_ui/material_ui.dart' show Alignment;

enum UserInfoType {
  fan('fan', .centerLeft),
  follow('focus on', .center),
  like('Liked', .centerRight),
  ;

  final String title;
  final Alignment alignment;

  const UserInfoType(this.title, this.alignment);
}
