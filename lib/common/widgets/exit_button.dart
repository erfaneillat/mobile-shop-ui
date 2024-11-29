import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/common/gen/assets.gen.dart';
import 'package:mobileshop/common/navigation/navigation_flow.dart';
import 'package:mobileshop/common/providers/providers.dart';

class ExitButton extends HookConsumerWidget {
  const ExitButton({
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
          await ref.read(sharedPreferencesProvider).remove('token');
          NavigationFlow.popAllToWelcomePage();
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
                'exit'.tr(),
                style: context.textTheme.labelMedium!
                    .copyWith(color: Color(0xff141414).withOpacity(0.6)),
              ),
              8.widthBox,
              Assets.icons.exit.image(
                width: 16,
                height: 16,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
