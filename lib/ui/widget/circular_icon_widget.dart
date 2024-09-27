import 'package:flutter/material.dart';

/// Class for circular icon widget
class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({super.key, required this.widget});

  final Widget widget;

  /// Build method to load ui
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20.0)),
      child: widget,
    );
  }
}
