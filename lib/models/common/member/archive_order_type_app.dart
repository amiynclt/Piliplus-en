import 'package:PiliPlus/models/common/enum_with_label.dart';

enum ArchiveOrderTypeApp with EnumWithLabel {
  pubdate('Latest releases'),
  click('Most played'),
  ;

  @override
  final String label;
  const ArchiveOrderTypeApp(this.label);
}
