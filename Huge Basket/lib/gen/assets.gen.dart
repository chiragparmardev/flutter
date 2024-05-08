/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/burger.png
  AssetGenImage get burger => const AssetGenImage('assets/images/burger.png');

  /// File path: assets/images/food1.png
  AssetGenImage get food1 => const AssetGenImage('assets/images/food1.png');

  /// File path: assets/images/fries.png
  AssetGenImage get fries => const AssetGenImage('assets/images/fries.png');

  /// File path: assets/images/ice-cream.png
  AssetGenImage get iceCream =>
      const AssetGenImage('assets/images/ice-cream.png');

  /// File path: assets/images/ice-cream1.png
  AssetGenImage get iceCream1 =>
      const AssetGenImage('assets/images/ice-cream1.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/milk-bottle.png
  AssetGenImage get milkBottle =>
      const AssetGenImage('assets/images/milk-bottle.png');

  /// File path: assets/images/milk-box.png
  AssetGenImage get milkBox =>
      const AssetGenImage('assets/images/milk-box.png');

  /// File path: assets/images/milk-shake.png
  AssetGenImage get milkShake =>
      const AssetGenImage('assets/images/milk-shake.png');

  /// File path: assets/images/milk.png
  AssetGenImage get milk => const AssetGenImage('assets/images/milk.png');

  /// File path: assets/images/pancakes.png
  AssetGenImage get pancakes =>
      const AssetGenImage('assets/images/pancakes.png');

  /// File path: assets/images/pizza.png
  AssetGenImage get pizza => const AssetGenImage('assets/images/pizza.png');

  /// File path: assets/images/spaghetti.png
  AssetGenImage get spaghetti =>
      const AssetGenImage('assets/images/spaghetti.png');

  /// File path: assets/images/splace.png
  AssetGenImage get splace => const AssetGenImage('assets/images/splace.png');

  /// File path: assets/images/splace1.png
  AssetGenImage get splace1 => const AssetGenImage('assets/images/splace1.png');

  /// File path: assets/images/splace2.png
  AssetGenImage get splace2 => const AssetGenImage('assets/images/splace2.png');

  /// File path: assets/images/splace3.png
  AssetGenImage get splace3 => const AssetGenImage('assets/images/splace3.png');

  /// File path: assets/images/store.jpg
  AssetGenImage get store => const AssetGenImage('assets/images/store.jpg');

  /// File path: assets/images/vegetables.png
  AssetGenImage get vegetables =>
      const AssetGenImage('assets/images/vegetables.png');

  /// File path: assets/images/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/images/visa.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        burger,
        food1,
        fries,
        iceCream,
        iceCream1,
        logo,
        milkBottle,
        milkBox,
        milkShake,
        milk,
        pancakes,
        pizza,
        spaghetti,
        splace,
        splace1,
        splace2,
        splace3,
        store,
        vegetables,
        visa
      ];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/cart_empty.json
  String get cartEmpty => 'assets/json/cart_empty.json';

  /// File path: assets/json/chat.json
  String get chat => 'assets/json/chat.json';

  /// File path: assets/json/chat1.json
  String get chat1 => 'assets/json/chat1.json';

  /// File path: assets/json/loading.json
  String get loading => 'assets/json/loading.json';

  /// File path: assets/json/location.json
  String get location => 'assets/json/location.json';

  /// File path: assets/json/location1.json
  String get location1 => 'assets/json/location1.json';

  /// File path: assets/json/order_confirm.json
  String get orderConfirm => 'assets/json/order_confirm.json';

  /// File path: assets/json/payment.json
  String get payment => 'assets/json/payment.json';

  /// File path: assets/json/payment1.json
  String get payment1 => 'assets/json/payment1.json';

  /// List of all assets
  List<String> get values => [
        cartEmpty,
        chat,
        chat1,
        loading,
        location,
        location1,
        orderConfirm,
        payment,
        payment1
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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
