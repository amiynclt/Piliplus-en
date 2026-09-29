import 'package:PiliPlus/models/common/enum_with_label.dart';

enum SuperResolutionType with EnumWithLabel {
  disable('Disable'),
  efficiency('efficiency'),
  quality('Image quality'),
  ;

  @override
  final String label;
  const SuperResolutionType(this.label);
}
