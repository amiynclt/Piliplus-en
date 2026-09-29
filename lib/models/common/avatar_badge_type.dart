import 'package:PiliPlus/utils/bili_colors.dart';
import 'package:material_ui/material_ui.dart';

enum BadgeType {
  none(),
  vip('big member'),
  person('Certified individuals', BiliColors.yellow),
  institution('certification body', Colors.lightBlueAccent),
  ;

  final String? desc;
  final Color? color;
  const BadgeType([this.desc, this.color]);
}
