enum FavOrderType {
  mtime('Recently collected'),
  view('Most played'),
  pubtime('Recent contributions'),
  ;

  final String label;

  const FavOrderType(this.label);
}
