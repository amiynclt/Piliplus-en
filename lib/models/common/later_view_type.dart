import 'package:PiliPlus/pages/later/child_view.dart';
import 'package:material_ui/material_ui.dart';

enum LaterViewType {
  all(0, 'all'),
  // toView(1, 'Not seen'),
  unfinished(2, 'Not finished yet'),
  // viewed(3, 'Already finished reading'),
  ;

  Widget get page => LaterViewChildPage(laterViewType: this);

  final int type;
  final String title;
  const LaterViewType(this.type, this.title);
}
