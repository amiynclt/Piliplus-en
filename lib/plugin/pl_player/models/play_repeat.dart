import 'package:PiliPlus/models/common/enum_with_label.dart';

enum PlayRepeat implements EnumWithLabel {
  pause('Pause after playing'),
  listOrder('Play sequentially'),
  singleCycle('single loop'),
  listCycle('List loop'),
  autoPlayRelated('Automatic broadcast'),
  ;

  @override
  final String label;
  const PlayRepeat(this.label);
}
