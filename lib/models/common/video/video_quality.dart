enum VideoQuality {
  hdrVivid(129, 'HDR Vivid', 'HDR Vivid'),
  super8k(127, '8K Ultra HD', '8K'),
  dolbyVision(126, 'Dolby Vision', 'Dolby'),
  hdr(125, 'HDR true color', 'HDR'),
  super4K(120, '4K Ultra HD', '4K'),
  high108060(116, '1080P 60 frames', '1080P60'),
  high1080plus(112, '1080P high bit rate', '1080P+'),
  high1080(80, '1080P HD', '1080P'),
  high72060(74, '720P 60 frames', '720P60'),
  high720(64, '720P quasi HD', '720P'),
  clear480(32, '480P SD', '480P'),
  fluent360(16, '360P smooth', '360P'),
  speed240(6, '240P extremely fast', '240P'),
  ;

  final int code;
  final String desc;
  final String shortDesc;

  const VideoQuality(this.code, this.desc, this.shortDesc);

  static final _codeMap = {for (final i in values) i.code: i};

  static VideoQuality fromCode(int code) => _codeMap[code]!;
}
