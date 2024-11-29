import 'package:flutter/material.dart';
import 'package:mobileshop/common/extensions/context.dart';

class ProductBackground extends StatelessWidget {
  const ProductBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: context.colorScheme.secondaryContainer,
        ),
        Positioned(
            right: -40,
            bottom: -40,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffC2D4D9),
                    blurRadius: 50,
                    spreadRadius: 8,
                  )
                ],
              ),
            )),
        Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffC2D4D9),
                    blurRadius: 50,
                    spreadRadius: 8,
                  )
                ],
              ),
            )),
        Positioned.fill(child: child)
      ],
    );
  }
}
