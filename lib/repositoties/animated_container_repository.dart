import 'dart:math';

import 'package:bloc_animated_container/models/animated_container_model.dart';
import 'package:flutter/material.dart';

class AnimatedContainerRepository {
  double? width = 100;
  double? height = 100;
  Color? color = Colors.green;
  int duration = 1;
  AnimatedContainerRepository({this.width, this.height, this.color, required this.duration});

  AnimatedContainerModel getAnimatedContainer() {
    final random = Random();

    width = random.nextInt(300).toDouble();
    height = random.nextInt(300).toDouble();

    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    AnimatedContainerModel data =
        AnimatedContainerModel(width: width, height: height, color: color, duration: duration);
    return data;
  }
}
