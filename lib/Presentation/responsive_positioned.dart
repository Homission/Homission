import 'package:flutter/material.dart';

class ResponsivePositioned extends StatelessWidget {
  final double x;
  final double y;
  final double width;
  final double height;
  final Widget child;

  ResponsivePositioned({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final designWidth = 360.0; // Figma 디자인 기준 너비
    final designHeight = 640.0; // Figma 디자인 기준 높이

    final widthRatio = screenWidth / designWidth;
    final heightRatio = screenHeight / designHeight;

    final adjustedX = x * widthRatio;
    final adjustedY = y * heightRatio;
    final adjustedWidth = width * widthRatio;
    final adjustedHeight = height * heightRatio;

    return Positioned(
      left: adjustedX,
      top: adjustedY,
      width: adjustedWidth,
      height: adjustedHeight,
      child: child,
    );
  }
}
