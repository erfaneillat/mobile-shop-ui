import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileshop/common/constants/constants.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/gen/assets.gen.dart';
import 'package:mobileshop/common/navigation/navigation_flow.dart';
import 'package:mobileshop/common/widgets/exit_button.dart';
import 'package:mobileshop/common/widgets/product_background.dart';
import 'package:mobileshop/features/product/presentation/widgets/product_widget.dart';
import 'package:mobileshop/main.dart';

class ProductList extends HookConsumerWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final scrollOffset = useState<double>(0);
    useEffect(
      () {
        scrollController.addListener(() {
          scrollOffset.value = scrollController.offset;
        });
        return () {
          scrollController.dispose();
        };
      },
      const [],
    );
    final scrolled = scrollOffset.value > 50;
    return ProductBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  top: 20, left: 0, child: ExitButton().animate().slideX()),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: scrolled ? 10 : 80,
                right:
                    scrolled ? 20 : MediaQuery.of(context).size.width / 2 - 85,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: AnimatedSize(
                            duration: 300.ms,
                            child: Assets.images.logo.image(
                              width: scrolled ? 80 : 130,
                              height: scrolled ? 80 : 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: scrolled ? 40 : 200,
                left: scrolled ? 0 : 20,
                right: scrolled ? 0 : 0,
                child: Text('shop'.tr(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.displayLarge),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: 0,
                right: 0,
                bottom: 0,
                top: scrolled ? 70 : 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 16),
                        child: GridView.builder(
                          controller: scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: Constants.fakeData.length,
                          itemBuilder: (c, i) {
                            final item = Constants.fakeData[i];
                            return ProductWidget(
                              item: item,
                              onTap: () {
                                NavigationFlow.toProductDetails();
                              },
                            ).animate().fadeIn(
                                  duration: 300.ms,
                                  delay: (i * 100).ms,
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
