import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/router/router.dart';

class CustomBackButton extends HookConsumerWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        onTap: () async {
          router.pop();
        },
        child: Ink(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: context.colorScheme.tertiary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'return'.tr(),
                style: context.textTheme.labelMedium!
                    .copyWith(color: Color(0xff141414).withOpacity(0.6)),
              ),
              8.widthBox,
              Icon(Icons.arrow_forward,
                  size: 20, color: Color(0xff141414).withOpacity(0.6)),
            ],
          ),
        ),
      ),
    );
  }
}
