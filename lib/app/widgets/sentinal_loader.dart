import 'package:flutter/material.dart';
import 'package:sentinal/gen/assets.gen.dart';

class SentinalLoader extends StatelessWidget {
  const SentinalLoader({
    this.height = 250,
    this.width = 250,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Assets.animations.cardLoadingAnimation.lottie(
      height: height,
      width: width,
    );
  }
}
