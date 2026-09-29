import 'package:PiliPlus/models/common/enum_with_label.dart';

enum ReplySortType implements EnumWithLabel {
  time('Latest comments', 'up to date', label: 'by time'),
  hot('Most popular comments', 'hottest', label: 'Press heat'),
  select('Featured Reviews', 'Featured'),
  ;

  @override
  final String label;
  final String desc;
  final String descShort;
  const ReplySortType(this.desc, this.descShort, {this.label = ''});
}
