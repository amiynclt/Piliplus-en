// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:PiliPlus/models/common/sponsor_block/action_type.dart';

enum SegmentType {
  sponsor(
    'Sponsorship/lunch',
    'sponsor',
    'Paid promotion, referrals and direct advertising. Not self-promotion or free mentions of merchandise/creators/sites/products they like.',
    Color(0xFF00d400),
    [
      ActionType.skip,
      ActionType.mute,
      ActionType.full,
    ],
  ),
  selfpromo(
    'Unpaid/self-promotion',
    'promotion',
    'Similar to "sponsored advertising" but without compensation or self-promotion. Include information about merchandise, donated parts, or collaborators.',
    Color(0xFFffff00),
    [
      ActionType.skip,
      ActionType.mute,
      ActionType.full,
    ],
  ),
  exclusive_access(
    'Exclusive access/early access',
    'Brand cooperation',
    'Only used to mark the entire video. Suitable for videos showing products, services or venues used by UP owners for free or with subsidies.',
    Color(0xFF008a5c),
    [ActionType.full],
  ),
  interaction(
    'Three consecutive/interactive reminders',
    'Three consecutive reminders',
    'In the middle of the video, there is a brief reminder to the audience to click three times or follow. If the clip is long or has specific content, it should be classified as self-promotion.',
    Color(0xFFcc00ff),
    [
      ActionType.skip,
      ActionType.mute,
    ],
  ),
  poi_highlight(
    'Highlights/Highlights',
    'Highlights',
    'Airborne time is what most people are looking for. Comments similar to "Cover at 12:34".',
    Color(0xFFff1684),
    [ActionType.poi],
  ),
  intro(
    'Cut scene/opening animation',
    'opening animation',
    'Interval segments with no actual content. Can be paused, static frame, or repeating animation. Not applicable to cutscenes that contain content.',
    Color(0xFF00ffff),
    [
      ActionType.skip,
      ActionType.mute,
    ],
  ),
  outro(
    'Acknowledgments/end screen',
    'Ending',
    'Credits screen or end screen. Does not include the end of the content.',
    Color(0xFF0202ed),
    [
      ActionType.skip,
      ActionType.mute,
    ],
  ),
  preview(
    'Review/Summary',
    'Preview',
    'Shows a collection of scenes that will appear in this video or a video in the same series. All content in the clip will appear again in the subsequent feature film.',
    Color(0xFF008fd6),
    [
      ActionType.skip,
      ActionType.mute,
    ],
  ),
  padding(
    'Fill content/front black/back black',
    'fill content',
    'Pure filler content that carries the beginning and end of a video, such as a black screen or irrelevant images, has no actual meaning or relevance to the main content of the video.',
    Color(0xFF222222),
    [ActionType.skip],
  ),
  filler(
    'Off-topic small talk/jokes',
    'digress',
    "仅作为填充内容或增添趣味而添加的离题片段，这些内容对理解视频的主要内容并非必需。这不包括提供背景信息或上下文的片段。这是一个非常激进的分类，适用于当你不想看'Entertainment'内容的时候。",
    Color(0xFF7300FF),
    [
      ActionType.skip,
      ActionType.mute,
    ],
  ),
  music_offtopic(
    'Music: Non-Musical Parts',
    'non-music',
    'For music videos only. This category can only be used for parts of the music video that are not included in other categories.',
    Color(0xFFff9900),
    [ActionType.skip],
  ),
  ;

  /// from https://github.com/hanydd/BilibiliSponsorBlock/blob/master/public/_locales/zh_CN/messages.json
  final String title;
  final String shortTitle;
  final String description;
  final Color color;
  final List<ActionType> toActionType;

  const SegmentType(
    this.title,
    this.shortTitle,
    this.description,
    this.color,
    this.toActionType,
  );
}

// List<SegmentType> _actionType2SegmentType(ActionType actionType) {
//   return switch (actionType) {
//     ActionType.skip => [
//         SegmentType.sponsor,
//         SegmentType.selfpromo,
//         SegmentType.interaction,
//         SegmentType.intro,
//         SegmentType.outro,
//         SegmentType.preview,
//         SegmentType.filler,
//       ],
//     ActionType.mute => [
//         SegmentType.sponsor,
//         SegmentType.selfpromo,
//         SegmentType.interaction,
//         SegmentType.intro,
//         SegmentType.outro,
//         SegmentType.preview,
//         SegmentType.music_offtopic,
//         SegmentType.filler,
//       ],
//     ActionType.full => [
//         SegmentType.sponsor,
//         SegmentType.selfpromo,
//         SegmentType.exclusive_access,
//       ],
//     ActionType.poi => [
//         SegmentType.poi_highlight,
//       ],
//   };
// }
