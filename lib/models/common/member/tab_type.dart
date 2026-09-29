import 'package:PiliPlus/utils/storage_pref.dart';

enum MemberTabType {
  def('default'),
  home('Home page'),
  dynamic('dynamic'),
  contribute('Contribute'),
  favorite('collect'),
  bangumi('Fan drama'),
  cheese('classroom'),
  shop('small shop'),
  ;

  static bool showMemberShop = Pref.showMemberShop;

  static bool contains(String type) {
    if (type == shop.name && !showMemberShop) {
      return false;
    }
    for (final e in MemberTabType.values) {
      if (e.name == type) {
        return true;
      }
    }
    return false;
  }

  final String title;
  const MemberTabType(this.title);
}
