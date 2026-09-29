import 'package:PiliPlus/models/common/enum_with_label.dart';

enum SuperChatType implements EnumWithLabel {
  valid('Display within valid time'),
  persist('permanent display'),
  disable('Don't show'),
  ;

  @override
  final String label;
  const SuperChatType(this.label);
}
