import 'package:PiliPlus/common/style.dart';
import 'package:material_ui/material_ui.dart' show BoxFit;

enum VideoFitType {
  fill('stretch', boxFit: BoxFit.fill),
  contain('automatic', boxFit: BoxFit.contain),
  cover('Crop', boxFit: BoxFit.cover),
  fitWidth('Equal width', boxFit: BoxFit.fitWidth),
  fitHeight('Equal height', boxFit: BoxFit.fitHeight),
  none('original', boxFit: BoxFit.none),
  scaleDown('limit', boxFit: BoxFit.scaleDown),
  ratio_4x3('4:3', aspectRatio: 4 / 3),
  ratio_16x9('16:9', aspectRatio: Style.aspectRatio16x9),
  ;

  final String desc;
  final BoxFit boxFit;
  final double? aspectRatio;
  const VideoFitType(
    this.desc, {
    this.boxFit = BoxFit.contain,
    this.aspectRatio,
  });
}
