// ignore_for_file: constant_identifier_names

enum LiveContributionRankType {
  online_rank('Online list', 'contribution_rank'),
  daily_rank('Daily list', 'today_rank'),
  weekly_rank('Weekly list', 'current_week_rank'),
  monthly_rank('Monthly list', 'current_month_rank'),
  ;

  final String title;
  final String sw1tch;
  const LiveContributionRankType(this.title, this.sw1tch);
}
