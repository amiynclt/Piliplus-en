enum AudioQuality {
  u_100010(100010, '100010'),
  u_100009(100009, '100009'),
  u_100008(100008, '100008'),
  hiRes(30251, 'Hi-Res lossless'),
  dolby_30250(30250, 'Dolby Atmos'),
  dolby_30255(30255, 'Dolby Atmos'),
  k192(30280, '192K'),
  k132(30232, '132K'),
  k64(30216, '64K'),
  ;

  final int code;
  final String desc;

  const AudioQuality(this.code, this.desc);

  static final _codeMap = {for (final i in values) i.code: i};

  static AudioQuality fromCode(int code) => _codeMap[code]!;
}
