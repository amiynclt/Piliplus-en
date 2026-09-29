// ignore_for_file: constant_identifier_names
import 'package:PiliPlus/http/api.dart';
import 'package:PiliPlus/models/common/enum_with_label.dart';

enum SearchType implements EnumWithLabel {
  all('comprehensive', api: Api.searchAll),
  // 视频：video
  video('video'),
  // 番剧：media_bangumi,
  media_bangumi('Fan drama'),
  // 影视：media_ft
  media_ft('Film and television'),
  // 直播间及主播：live
  // live,
  // 直播间：live_room
  live_room('Live broadcast room'),
  // 主播：live_user
  // live_user,
  // 话题：topic
  // topic,
  // 用户：bili_user
  bili_user('user'),
  // 专栏：article
  article('Column'),
  ;

  // 相簿：photo
  // photo

  @override
  final String label;
  final String api;
  const SearchType(this.label, {this.api = Api.searchByType});
}
