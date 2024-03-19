/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/PlusJakartaSans-Bold.ttf
  String get plusJakartaSansBold => 'assets/fonts/PlusJakartaSans-Bold.ttf';

  /// File path: assets/fonts/PlusJakartaSans-ExtraBold.ttf
  String get plusJakartaSansExtraBold =>
      'assets/fonts/PlusJakartaSans-ExtraBold.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Light.ttf
  String get plusJakartaSansLight => 'assets/fonts/PlusJakartaSans-Light.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Medium.ttf
  String get plusJakartaSansMedium => 'assets/fonts/PlusJakartaSans-Medium.ttf';

  /// File path: assets/fonts/PlusJakartaSans-Regular.ttf
  String get plusJakartaSansRegular =>
      'assets/fonts/PlusJakartaSans-Regular.ttf';

  /// File path: assets/fonts/PlusJakartaSans-SemiBold.ttf
  String get plusJakartaSansSemiBold =>
      'assets/fonts/PlusJakartaSans-SemiBold.ttf';

  /// File path: assets/fonts/PlusJakartaSans-SemiBoldItalic.ttf
  String get plusJakartaSansSemiBoldItalic =>
      'assets/fonts/PlusJakartaSans-SemiBoldItalic.ttf';

  /// List of all assets
  List<String> get values => [
        plusJakartaSansBold,
        plusJakartaSansExtraBold,
        plusJakartaSansLight,
        plusJakartaSansMedium,
        plusJakartaSansRegular,
        plusJakartaSansSemiBold,
        plusJakartaSansSemiBoldItalic
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cast.svg
  SvgGenImage get cast => const SvgGenImage('assets/icons/cast.svg');

  /// File path: assets/icons/dwon.svg
  SvgGenImage get dwon => const SvgGenImage('assets/icons/dwon.svg');

  /// File path: assets/icons/episode.svg
  SvgGenImage get episode => const SvgGenImage('assets/icons/episode.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/loading.png
  AssetGenImage get loading => const AssetGenImage('assets/icons/loading.png');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// List of all assets
  List<dynamic> get values =>
      [cast, dwon, episode, home, loading, location, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/characterBox.svg
  SvgGenImage get characterBox =>
      const SvgGenImage('assets/images/characterBox.svg');

  /// File path: assets/images/characterbg.png
  AssetGenImage get characterbg =>
      const AssetGenImage('assets/images/characterbg.png');

  /// File path: assets/images/locationBox.svg
  SvgGenImage get locationBox =>
      const SvgGenImage('assets/images/locationBox.svg');

  /// File path: assets/images/locationbg.png
  AssetGenImage get locationbg =>
      const AssetGenImage('assets/images/locationbg.png');

  /// File path: assets/images/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/logo.svg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/splash_overlay.png
  AssetGenImage get splashOverlay =>
      const AssetGenImage('assets/images/splash_overlay.png');

  /// List of all assets
  List<dynamic> get values => [
        bg,
        characterBox,
        characterbg,
        locationBox,
        locationbg,
        logo,
        splash,
        splashOverlay
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/empty.json
  LottieGenImage get empty => const LottieGenImage('assets/lottie/empty.json');

  /// File path: assets/lottie/empty_two.json
  LottieGenImage get emptyTwo =>
      const LottieGenImage('assets/lottie/empty_two.json');

  /// File path: assets/lottie/error.json
  LottieGenImage get error => const LottieGenImage('assets/lottie/error.json');

  /// List of all assets
  List<LottieGenImage> get values => [empty, emptyTwo, error];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar-SA.json
  String get arSA => 'assets/translations/ar-SA.json';

  /// File path: assets/translations/bn-BD.json
  String get bnBD => 'assets/translations/bn-BD.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/es-ES.json
  String get esES => 'assets/translations/es-ES.json';

  /// File path: assets/translations/hi-IN.json
  String get hiIN => 'assets/translations/hi-IN.json';

  /// List of all assets
  List<String> get values => [arSA, bnBD, enUS, esES, hiIN];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
