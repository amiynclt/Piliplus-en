import 'package:PiliPlus/models/common/enum_with_label.dart';

enum BarHideType with EnumWithLabel {
  instant('immediate'),
  sync('synchronous'),
  ;

  @override
  final String label;
  const BarHideType(this.label);
}
