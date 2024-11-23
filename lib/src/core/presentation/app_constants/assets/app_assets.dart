import 'package:flutter/material.dart';

class AppAssets {
  // static const String _illustrations = 'assets/png/illustrations';
  static const String _icons = 'assets/icons';
  // static const String _images = 'assets/images';
  //static const String _navBarIcons = 'assets/png/icons/navbar';
  static const String _payment_card = 'assets/payment_card';

  static final Map<String, String> _paths = {
    ///example
    ///'verification': '$_illustrations/emblem.svg',

    'arrow_right': '$_icons/arrow_right.png',
    'google_logo': '$_icons/google_logo.png',
    'facebook_logo': '$_icons/facebook_logo.png',

    ///card
    'mastercard': '$_payment_card/mastercard.png',
    'mastercard_white': '$_payment_card/mastercard_white.png',
    'visa_white': '$_payment_card/visa_white.png',
    'visa': '$_payment_card/visa.png',
    'helper_icon': '$_payment_card/help_outline.png',
    'chip_icon': '$_payment_card/chip.png',
  };

  static Image arrowRight({required double width, required double height}) =>
      Image.asset(_paths['arrow_right']!, width: width, height: height);
  static Image googleLogo({double? width, double? height}) =>
      Image.asset(_paths['google_logo']!, width: width, height: height);
  static Image facebookLogo({double? width, double? height}) =>
      Image.asset(_paths['facebook_logo']!, width: width, height: height);

  /// card
  static Image mastercard({required double width, required double height}) =>
      Image.asset(_paths['mastercard']!, width: width, height: height);
  static Image mastercardWhite(
          {required double width, required double height}) =>
      Image.asset(_paths['mastercard_white']!, width: width, height: height);
  static Image visaWhite({required double width, required double height}) =>
      Image.asset(_paths['visa_white']!, width: width, height: height);
  static Image visa({required double width, required double height}) =>
      Image.asset(_paths['visa']!, width: width, height: height);
  static Image helperIcon({required double width, required double height}) =>
      Image.asset(_paths['helper_icon']!, width: width, height: height);

  static Image chipIcon({required double width, required double height}) =>
      Image.asset(_paths['chip_icon']!, width: width, height: height);

  ///example
  // static Image emblem({required double width, required double height}) =>
  //     Image.asset(_paths['verification']!, width: width, height: height);

  // static AssetImage bgImage() => AssetImage(_paths['bgImage']!);
}
