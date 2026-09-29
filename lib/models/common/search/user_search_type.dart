enum UserOrderType {
  def('Default sort', 0, ''),
  fansDesc('Number of fans from high to low', 0, 'fans'),
  fansAsc('Number of followers from low to high', 1, 'fans'),
  levelDesc('Lv level from high to low', 0, 'level'),
  levelAsc('Lv level from low to high', 1, 'level'),
  ;

  final String label;
  final int orderSort;
  final String order;
  const UserOrderType(this.label, this.orderSort, this.order);
}

enum UserType {
  all('All users'),
  up('UP master'),
  common('Ordinary user'),
  verified('authenticated user'),
  ;

  final String label;
  const UserType(this.label);
}
