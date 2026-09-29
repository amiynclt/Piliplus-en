import 'package:PiliPlus/models/common/enum_with_label.dart';

enum DynamicsTabType implements EnumWithLabel {
  all('all'),
  video('Contribute'),
  pgc('Fan drama'),
  article('Column'),
  up('UP'),
  ;

  @override
  final String label;
  const DynamicsTabType(this.label);
}
