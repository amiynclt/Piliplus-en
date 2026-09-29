class SpaceSettingModel {
  SpaceSettingModel({
    required this.name,
    required this.key,
    required this.value,
    this.isReverse = false,
  });

  String name;
  String key;
  int? value;
  bool isReverse;

  bool get boolVal => isReverse ? value == 0 : value == 1;
}

class Privacy {
  List<SpaceSettingModel> list1;
  List<SpaceSettingModel> list2;
  List<SpaceSettingModel> list3;

  Privacy({
    required this.list1,
    required this.list2,
    required this.list3,
  });

  factory Privacy.fromJson(Map<String, dynamic> json) => Privacy(
    list1: [
      SpaceSettingModel(
        name: 'Make my collection public',
        key: 'fav_video',
        value: json['fav_video'],
      ),
      SpaceSettingModel(
        name: 'Publicize my fan-watching dramas',
        key: 'bangumi',
        value: json['bangumi'],
      ),
      SpaceSettingModel(
        name: 'Reveal my comic strips',
        key: 'comic',
        value: json['comic'],
      ),
      SpaceSettingModel(
        name: 'Publicize recent coin-tossed videos',
        key: 'coins_video',
        value: json['coins_video'],
      ),
      SpaceSettingModel(
        name: 'Publicize recently liked videos',
        key: 'likes_video',
        value: json['likes_video'],
      ),
      SpaceSettingModel(
        name: 'Publish recently played games',
        key: 'played_game',
        value: json['played_game'],
      ),
      SpaceSettingModel(
        name: 'Publicly owned fan costumes',
        key: 'dress_up',
        value: json['dress_up'],
      ),
      SpaceSettingModel(
        name: 'Make my watchlist public',
        key: 'disable_following',
        value: json['disable_following'],
        isReverse: true,
      ),
      SpaceSettingModel(
        name: 'Make my fan list public',
        key: 'disable_show_fans',
        value: json['disable_show_fans'],
        isReverse: true,
      ),
    ],
    list2: [
      SpaceSettingModel(
        name: 'Fan medals worn publicly',
        key: 'close_space_medal',
        value: json['close_space_medal'],
        isReverse: true,
      ),
      SpaceSettingModel(
        name: 'The medal wall publicly displays all fan medals',
        key: 'only_show_wearing',
        value: json['only_show_wearing'],
        isReverse: true,
      ),
      SpaceSettingModel(
        name: 'Disclose school information',
        key: 'disable_show_school',
        value: json['disable_show_school'],
        isReverse: true,
      ),
    ],
    list3: [
      SpaceSettingModel(
        name: 'Show live replays in the submitted video list',
        key: 'live_playback',
        value: json['live_playback'],
      ),
      SpaceSettingModel(
        name: 'Exclusive videos for monthly charging are displayed in the submitted video list',
        key: 'charge_video',
        value: json['charge_video'],
      ),
      SpaceSettingModel(
        name: 'Display class videos in the submission video list',
        key: 'lesson_video',
        value: json['lesson_video'],
      ),
    ],
  );
}
