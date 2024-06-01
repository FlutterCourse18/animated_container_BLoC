import 'package:flutter/material.dart';

class AnimatedContainerModel {
  final double? width;
  final double? height;
  final Color? color;
  final int duration;
  AnimatedContainerModel(
      {required this.duration,
      required this.width,
      required this.height,
      required this.color});
}
