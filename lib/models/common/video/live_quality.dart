enum LiveQuality {
  dolby(30000, 'Dolby'),
  origin4K(25000, '4K original painting'),
  super4K(20000, '4K'),
  super2K(15000, '2K'),
  origin(10000, 'original painting'),
  bluRay(400, 'Blu-ray'),
  superHD(250, 'ultra clear'),
  smooth(150, 'HD'),
  flunt(80, 'Smooth'),
  ;

  final int code;
  final String desc;
  const LiveQuality(this.code, this.desc);

  static LiveQuality? fromCode(int? code) {
    for (final e in LiveQuality.values) {
      if (e.code == code) {
        return e;
      }
    }
    return null;
  }
}
