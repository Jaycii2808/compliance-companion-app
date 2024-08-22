/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_toggle_moon.svg
  String get icToggleMoon => 'assets/icons/ic_toggle_moon.svg';

  /// File path: assets/icons/ic_toggle_sun.svg
  String get icToggleSun => 'assets/icons/ic_toggle_sun.svg';

  /// List of all assets
  List<String> get values => [icToggleMoon, icToggleSun];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon_flutter.png
  AssetGenImage get iconFlutterPng =>
      const AssetGenImage('assets/images/icon_flutter.png');

  /// File path: assets/images/icon_flutter.svg
  String get iconFlutterSvg => 'assets/images/icon_flutter.svg';

  /// File path: assets/images/img_avatar.png
  AssetGenImage get imgAvatar =>
      const AssetGenImage('assets/images/img_avatar.png');

  /// File path: assets/images/img_toggle_cloud.svg
  String get imgToggleCloud => 'assets/images/img_toggle_cloud.svg';

  /// File path: assets/images/img_toggle_day_background.png
  AssetGenImage get imgToggleDayBackgroundPng =>
      const AssetGenImage('assets/images/img_toggle_day_background.png');

  /// File path: assets/images/img_toggle_day_background.svg
  String get imgToggleDayBackgroundSvg =>
      'assets/images/img_toggle_day_background.svg';

  /// File path: assets/images/img_toggle_night_background.png
  AssetGenImage get imgToggleNightBackgroundPng =>
      const AssetGenImage('assets/images/img_toggle_night_background.png');

  /// File path: assets/images/img_toggle_night_background.svg
  String get imgToggleNightBackgroundSvg =>
      'assets/images/img_toggle_night_background.svg';

  /// File path: assets/images/img_toggle_star.svg
  String get imgToggleStar => 'assets/images/img_toggle_star.svg';

  /// List of all assets
  List<dynamic> get values => [
        iconFlutterPng,
        iconFlutterSvg,
        imgAvatar,
        imgToggleCloud,
        imgToggleDayBackgroundPng,
        imgToggleDayBackgroundSvg,
        imgToggleNightBackgroundPng,
        imgToggleNightBackgroundSvg,
        imgToggleStar
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
