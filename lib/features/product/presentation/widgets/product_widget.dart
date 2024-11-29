import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/main.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.item,
    required this.onTap,
  });

  final Map<String, String> item;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 4,
            right: 4,
            bottom: 0,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Ink(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: context.colorScheme.surface,
                ),
                child: Column(
                  children: [
                    Expanded(flex: 2, child: SizedBox()),
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text(
                              item['title']!,
                              style: context.textTheme.displayMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  item['price']!,
                                  style: context.textTheme.labelLarge!.copyWith(
                                      fontSize: 25, color: Color(0xff989898)),
                                ),
                                Text(
                                  'تومان',
                                  style: context.textTheme.labelLarge!.copyWith(
                                      fontSize: 15, color: Color(0xff989898)),
                                )
                              ],
                            ),
                            12.heightBox,
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 0,
            child: IgnorePointer(
              child: Image.asset(
                item['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
