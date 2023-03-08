import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app_2/constants/constants.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism(
      {super.key,
      required this.theChild,
      required this.theHeight,
      required this.theWidth,
      required this.theColor});

  final double theWidth;
  final double theHeight;
  final Color theColor;
  final Widget theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          height: theHeight,
          width: theWidth,
          decoration: BoxDecoration(
            color: theColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: theChild,
        ),
      ),
    );
  }
}
