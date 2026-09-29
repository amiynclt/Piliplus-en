import 'package:PiliPlus/models/common/enum_with_label.dart';

enum ArchiveOrderTypeWeb with EnumWithLabel {
  pubdate('Latest releases'),
  click('Most played'),
  stow('Most favorites'),
  ;

  @override
  final String label;
  const ArchiveOrderTypeWeb(this.label);
}
