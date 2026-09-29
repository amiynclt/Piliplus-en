import 'package:PiliPlus/http/api.dart';

enum PgcReviewType {
  long(label: 'Long comment', api: Api.pgcReviewL),
  short(label: 'short review', api: Api.pgcReviewS),
  ;

  final String label;
  final String api;
  const PgcReviewType({
    required this.label,
    required this.api,
  });
}

enum PgcReviewSortType {
  def('default', 0),
  latest('up to date', 1),
  ;

  final int sort;
  final String label;
  const PgcReviewSortType(this.label, this.sort);
}
