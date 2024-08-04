import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget padding({
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? (horizontal ?? 0),
        right: right ?? (horizontal ?? 0),
        top: top ?? (vertical ?? 0),
        bottom: bottom ?? (vertical ?? 0),
      ),
      child: this,
    );
  }
}