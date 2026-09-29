import 'package:PiliPlus/models/common/enum_with_label.dart';

enum BtmProgressBehavior implements EnumWithLabel {
  alwaysShow('Always show'),
  alwaysHide('always hidden'),
  onlyShowFullScreen('Only shown in full screen'),
  onlyHideFullScreen('Hide only when full screen'),
  ;

  @override
  final String label;
  const BtmProgressBehavior(this.label);
}
