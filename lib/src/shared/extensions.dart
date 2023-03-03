import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double getPercent(double value, double percent) => (value * 0.01) * percent;
  double getHeightPercent(double percent) => getPercent(height, percent);
  double getWidthPercent(double percent) => getPercent(width, percent);
  double get height10 => getHeightPercent(10);
  double get width10 => getWidthPercent(10);
  double get height20 => getHeightPercent(20);
  double get width20 => getWidthPercent(20);
  double get height30 => getHeightPercent(30);
  double get width30 => getWidthPercent(30);
  double get height40 => getHeightPercent(40);
  double get width40 => getWidthPercent(40);
  double get height50 => getHeightPercent(50);
  double get width50 => getWidthPercent(50);
  double get height60 => getHeightPercent(60);
  double get width60 => getWidthPercent(60);
  double get height70 => getHeightPercent(70);
  double get width70 => getWidthPercent(70);
  double get height80 => getHeightPercent(80);
  double get width80 => getWidthPercent(80);
  double get height90 => getHeightPercent(90);
  double get width90 => getWidthPercent(90);
  // Padding
  double get appVerticalPadding => height10 / 4;
  double get appHorizontalPadding => width10 / 2.5;
  double get appHorizontalPaddingExcepted => width - (2 * appHorizontalPadding);
  double get appVerticalPaddingExcepted => height - (2 * appVerticalPadding);
  double appHorizontalPaddingExceptedTo(double value) =>
      value - (2 * appHorizontalPadding);
  double appVerticalPaddingExceptedTo(double value) =>
      value - (2 * appVerticalPadding);
}
