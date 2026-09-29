import 'package:PiliPlus/models/common/enum_with_label.dart';

enum UpPanelPosition implements EnumWithLabel {
  top('top'),
  leftFixed('left permanent'),
  rightFixed('Permanent on the right'),
  leftDrawer('left drawer'),
  rightDrawer('right drawer'),
  ;

  @override
  final String label;
  const UpPanelPosition(this.label);
}
