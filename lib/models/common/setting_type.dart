import 'package:PiliPlus/pages/setting/models/extra_settings.dart';
import 'package:PiliPlus/pages/setting/models/model.dart';
import 'package:PiliPlus/pages/setting/models/play_settings.dart';
import 'package:PiliPlus/pages/setting/models/privacy_settings.dart';
import 'package:PiliPlus/pages/setting/models/recommend_settings.dart';
import 'package:PiliPlus/pages/setting/models/style_settings.dart';
import 'package:PiliPlus/pages/setting/models/video_settings.dart';

enum SettingType {
  privacySetting('Privacy settings'),
  recommendSetting('Recommended streaming settings'),
  videoSetting('Audio and video settings'),
  playSetting('Player settings'),
  styleSetting('Appearance settings'),
  extraSetting('Other settings'),
  webdavSetting('WebDAV settings'),
  about('about'),
  ;

  final String title;
  const SettingType(this.title);

  List<SettingsModel> get settings => switch (this) {
    .privacySetting => privacySettings,
    .recommendSetting => recommendSettings,
    .videoSetting => videoSettings,
    .playSetting => playSettings,
    .styleSetting => styleSettings,
    .extraSetting => extraSettings,
    _ => throw UnimplementedError(),
  };
}
