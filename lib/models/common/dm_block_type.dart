enum DmBlockType {
  keyword('keywords'),
  regex('regular'),
  uid('user'),
  ;

  final String label;
  const DmBlockType(this.label);
}
