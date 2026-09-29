import 'package:PiliPlus/models/common/enum_with_label.dart';

enum DynamicBadgeMode implements EnumWithLabel {
  hidden('hide'),
  point('red dot'),
  number('number'),
  ;

  @override
  final String label;
  const DynamicBadgeMode(this.label);
}
