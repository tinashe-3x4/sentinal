import 'package:flutter/widgets.dart';

enum Spacing {
  tiny(4),
  small(8),
  medium(16),
  large(24),
  extraLarge(32),
  huge(48);

  const Spacing(this.value);

  final double value;

  /// Returns a SizedBox with the specified vertical spacing
  Widget get vertical => SizedBox(height: value);

  /// Returns a SizedBox with the specified horizontal spacing
  Widget get horizontal => SizedBox(width: value);

  /// Returns vertical padding with the specified spacing
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: value);

  /// Returns horizontal padding with the specified spacing
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: value);

  /// Returns all-sides padding with the specified spacing
  EdgeInsets get padding => EdgeInsets.all(value);

  /// Returns top padding with the specified spacing
  EdgeInsets get paddingTop => EdgeInsets.only(top: value);

  /// Returns bottom padding with the specified spacing
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: value);

  /// Returns left padding with the specified spacing
  EdgeInsets get paddingLeft => EdgeInsets.only(left: value);

  /// Returns right padding with the specified spacing
  EdgeInsets get paddingRight => EdgeInsets.only(right: value);

  /// Returns margin with the specified spacing on all sides
  EdgeInsets get margin => EdgeInsets.all(value);

  /// Returns vertical margin with the specified spacing
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: value);

  /// Returns horizontal margin with the specified spacing
  EdgeInsets get marginHorizontal => EdgeInsets.symmetric(horizontal: value);

  /// Creates custom padding using combinations of different spacings
  EdgeInsets insets({
    Spacing? top,
    Spacing? bottom,
    Spacing? left,
    Spacing? right,
  }) {
    return EdgeInsets.only(
      top: top?.value ?? 0,
      bottom: bottom?.value ?? 0,
      left: left?.value ?? 0,
      right: right?.value ?? 0,
    );
  }
}
