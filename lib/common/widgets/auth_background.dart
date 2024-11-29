import 'package:flutter/material.dart';
import 'package:mobileshop/common/extensions/context.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: context.theme.scaffoldBackgroundColor,
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
                    color: Color(0xffCCD3F4),
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
                    color: Color(0xffCCD3F4),
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
