import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_ui/material_ui.dart';

enum ReplyOptionType {
  allow('Allow comments'),
  close('Close comments'),
  choose('Featured Reviews'),
  ;

  final String title;
  const ReplyOptionType(this.title);

  IconData get iconData => switch (this) {
    ReplyOptionType.allow => MdiIcons.commentTextOutline,
    ReplyOptionType.close => MdiIcons.commentOffOutline,
    ReplyOptionType.choose => MdiIcons.commentProcessingOutline,
  };
}
