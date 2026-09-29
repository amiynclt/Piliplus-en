const double kScreenRatio = 1.2;

// 全屏模式
enum FullScreenMode {
  // 根据内容自适应
  auto('By video orientation (default)'),
  // 不改变当前方向
  none('Do not change current direction'),
  // 始终竖屏
  vertical('Force vertical screen'),
  // 始终横屏
  horizontal('Force horizontal screen'),
  // 屏幕长宽比 < kScreenRatio 或为竖屏视频时竖屏，否则横屏
  ratio('Screen aspect ratio <$kScreenRatio or vertical screen when the video is vertical screen, otherwise horizontal screen'),
  // 强制重力转屏（仅安卓）
  gravity('Ignore system orientation lock and force screen rotation by gravity (Android only)'),
  ;

  final String desc;
  const FullScreenMode(this.desc);
}
