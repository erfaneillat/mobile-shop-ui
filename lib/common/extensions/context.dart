import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef DoubleCallback = double Function();

extension ExtensionOnContext on BuildContext {
  double get width => (MediaQuery.of(this).size.width > 600 && kIsWeb)
      ? 450
      : MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get statusBarSize => MediaQuery.of(this).viewPadding.top;

  void showMessage(String message, SnackBarType type) {
    final isError = type == SnackBarType.error;
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error : Icons.check_circle,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(message,
              style: textTheme.labelMedium!.copyWith(color: Colors.white)),
        ],
      ),
      dismissDirection: DismissDirection.down,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      backgroundColor: isError ? Colors.red[400] : Colors.green[400],
    ));
  }

  // bool get isSmallSizedMobile => ResponsiveBuilder.isSmallSizedMobile(this);

  // bool get isMobile => ResponsiveBuilder.isMobile(this);

  // bool get isTablet => ResponsiveBuilder.isTablet(this);

  // double getResponsiveValue({
  //   required DoubleCallback smallSizedMobile,
  //   required DoubleCallback mobile,
  //   required DoubleCallback tablet,
  //   DoubleCallback? desktop,
  // }) {
  //   if (isSmallSizedMobile) {
  //     return smallSizedMobile();
  //   }
  //   if (isMobile) {
  //     return mobile();
  //   }

  //   if (desktop != null && isTablet) {
  //     return desktop();
  //   }

  //   return tablet();
  // }
}

enum SnackBarType { error, success }
