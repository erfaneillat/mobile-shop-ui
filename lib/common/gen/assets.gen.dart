/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Yekan-Bold.woff
  String get yekanBold => 'assets/fonts/Yekan-Bold.woff';

  /// File path: assets/fonts/Yekan-Fat.woff
  String get yekanFat => 'assets/fonts/Yekan-Fat.woff';

  /// File path: assets/fonts/Yekan-Heavy.woff
  String get yekanHeavy => 'assets/fonts/Yekan-Heavy.woff';

  /// File path: assets/fonts/Yekan-Medium.woff
  String get yekanMedium => 'assets/fonts/Yekan-Medium.woff';

  /// File path: assets/fonts/Yekan-Regular.woff
  String get yekanRegular => 'assets/fonts/Yekan-Regular.woff';

  /// List of all assets
  List<String> get values =>
      [yekanBold, yekanFat, yekanHeavy, yekanMedium, yekanRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_down.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/icons/arrow_down.png');

  /// File path: assets/icons/arrow_up.png
  AssetGenImage get arrowUp => const AssetGenImage('assets/icons/arrow_up.png');

  /// File path: assets/icons/exit.png
  AssetGenImage get exit => const AssetGenImage('assets/icons/exit.png');

  /// List of all assets
  List<AssetGenImage> get values => [arrowDown, arrowUp, exit];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/clock.png');

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/phones.png
  AssetGenImage get phones => const AssetGenImage('assets/images/phones.png');

  /// File path: assets/images/ps.png
  AssetGenImage get ps => const AssetGenImage('assets/images/ps.png');

  /// File path: assets/images/ps2.png
  AssetGenImage get ps2 => const AssetGenImage('assets/images/ps2.png');

  /// File path: assets/images/tv.png
  AssetGenImage get tv => const AssetGenImage('assets/images/tv.png');

  /// File path: assets/images/welcome_page_image.png
  AssetGenImage get welcomePageImage =>
      const AssetGenImage('assets/images/welcome_page_image.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [clock, login, logo, phones, ps, ps2, tv, welcomePageImage];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/fa-IR.json
  String get faIR => 'assets/translations/fa-IR.json';

  /// List of all assets
  List<String> get values => [faIR];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
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
    bool gaplessPlayback = true,
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
