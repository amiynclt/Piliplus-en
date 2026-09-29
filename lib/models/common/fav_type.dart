import 'package:PiliPlus/pages/fav/article/view.dart';
import 'package:PiliPlus/pages/fav/cheese/view.dart';
import 'package:PiliPlus/pages/fav/note/view.dart';
import 'package:PiliPlus/pages/fav/pgc/view.dart';
import 'package:PiliPlus/pages/fav/topic/view.dart';
import 'package:PiliPlus/pages/fav/video/view.dart';
import 'package:material_ui/material_ui.dart';

enum FavTabType {
  video('video', FavVideoPage()),
  bangumi('Chase', FavPgcPage(type: 1)),
  cinema('Catch up on dramas', FavPgcPage(type: 2)),
  article('Column', FavArticlePage()),
  note('notes', FavNotePage()),
  topic('topic', FavTopicPage()),
  cheese('classroom', FavCheesePage()),
  ;

  final String title;
  final Widget page;
  const FavTabType(this.title, this.page);
}
