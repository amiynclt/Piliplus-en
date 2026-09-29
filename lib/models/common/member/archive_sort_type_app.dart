import 'package:PiliPlus/models/common/enum_with_label.dart';

enum ArchiveSortTypeApp with EnumWithLabel {
  desc('default'),
  asc('reverse order'),
  ;

  @override
  final String label;
  const ArchiveSortTypeApp(this.label);
}
