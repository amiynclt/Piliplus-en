import 'package:PiliPlus/models/common/enum_with_label.dart';

enum SkipType implements EnumWithLabel {
  alwaysSkip('always skip'),
  skipOnce('skip once'),
  skipManually('manual skip'),
  showOnly('Show only'),
  disable('Disable'),
  ;

  @override
  final String label;
  const SkipType(this.label);
}
