import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 20, this.color = Colors.white});
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.beat(color: color, size: size);
  }
}
