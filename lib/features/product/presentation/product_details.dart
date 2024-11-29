import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/common/gen/assets.gen.dart';
import 'package:mobileshop/common/widgets/custom_back_button.dart';
import 'package:mobileshop/common/widgets/exit_button.dart';
import 'package:mobileshop/common/widgets/product_background.dart';
import 'package:mobileshop/main.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends HookWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              child: CustomBackButton().animate().slideX(),
            ),
            Positioned.fill(
                top: 40,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xff0183FF),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff0183FF).withOpacity(0.4),
                                offset: Offset(1, 3),
                                blurRadius: 10,
                              )
                            ]),
                        child: Text('دسته بازی',
                            style: context.textTheme.labelMedium!
                                .copyWith(color: Colors.white)),
                      ).animate().slideX(begin: 1),
                      14.heightBox,
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('دسته بازی مخصوص XBOX',
                                textAlign: TextAlign.center,
                                style: context.textTheme.labelLarge!
                                    .copyWith(fontSize: 30)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "500,000",
                                  style: context.textTheme.labelLarge!.copyWith(
                                      fontSize: 25, color: Color(0xff989898)),
                                ),
                                4.widthBox,
                                Text(
                                  'تومان',
                                  style: context.textTheme.labelLarge!.copyWith(
                                      fontSize: 15, color: Color(0xff989898)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      12.heightBox,
                      _Images(),
                      12.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            _Description(),
                            32.heightBox,
                            _SelectColor(),
                            12.heightBox,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'add_to_cart'.tr(),
                                    style: context.textTheme.displayLarge!
                                        .copyWith(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}

class _SelectColor extends HookWidget {
  const _SelectColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = useState(0);
    final colors = [
      Colors.white,
      Colors.blue,
      Colors.yellow,
      Colors.black,
    ];
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Text('select_color'.tr(), style: context.textTheme.displayLarge),
          32.widthBox,
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: colors.map((e) {
              final selected = colors.indexOf(e) == selectedColor.value;
              return InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  selectedColor.value = colors.indexOf(e);
                },
                child: AnimatedContainer(
                  duration: 200.ms,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: selected ? 50 : 35,
                  height: selected ? 50 : 35,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      color: e,
                      borderRadius: BorderRadius.circular(100)),
                ),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }
}

class _Description extends HookWidget {
  const _Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final collapsed = useState(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('description'.tr(), style: context.textTheme.displayLarge),
        4.heightBox,
        Stack(
          children: [
            AnimatedSize(
              duration: 200.ms,
              child: Text(
                'اگر شما یک طراح هستین و یا با طراحی های گرافیکی سروکار دارید به متن های برخورده اید که با نام لورم ایپسوم شناخته می‌شوند. لورم ایپسوم یا طرح‌نما (به انگلیسی: Lorem ipsum) متنی ساختگی و بدون معنی است که برای امتحان فونت و یا پر کردن فضا در یک طراحی گرافیکی و یا صنعت چاپ استفاده میشود. طراحان وب و گرافیک از این متن برای پرکردن صفحه و ارائه شکل کلی طرح استفاده می‌کنند.',
                maxLines: collapsed.value ? 3 : null,
                style: context.textTheme.labelMedium!.copyWith(
                    fontSize: 16, color: context.textTheme.displaySmall!.color),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: AnimatedSwitcher(
                duration: 250.ms,
                child: !collapsed.value
                    ? SizedBox()
                    : Container(
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.9),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.5),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.3),
                              Colors.transparent,
                            ])),
                      ),
              ),
            )
          ],
        ),
        4.heightBox,
        InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            collapsed.value = !collapsed.value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              !collapsed.value ? '${'less'.tr()} -' : '${'more'.tr()} +',
              style: context.textTheme.displayLarge!
                  .copyWith(fontSize: 14, color: Color(0xff0183FF)),
            ),
          ),
        ),
      ],
    );
  }
}

class _Images extends HookWidget {
  const _Images({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedImage = useState(0);
    final images = [
      {
        '0': Assets.images.ps2,
      },
      {
        '1': Assets.images.ps2,
      },
      {
        '2': Assets.images.ps2,
      }
    ];
    return SizedBox(
      height: context.height * 0.4,
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Stack(
                children: [
                  PageView.builder(
                    scrollDirection: Axis.vertical,
                    onPageChanged: (index) {
                      selectedImage.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Assets.images.ps2.image(fit: BoxFit.cover);
                    },
                    itemCount: 3,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              context.colorScheme.secondaryContainer
                                  .withOpacity(1),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.5),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.3),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.1),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0),
                            ])),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: IgnorePointer(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                                colors: [
                              context.colorScheme.secondaryContainer
                                  .withOpacity(1),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.5),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.3),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0.1),
                              context.colorScheme.secondaryContainer
                                  .withOpacity(0),
                              //  Colors.transparent,
                            ])),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.arrowUp.image(),
                  ...images.map((e) {
                    final selected =
                        e.keys.first == selectedImage.value.toString();
                    return AnimatedContainer(
                      duration: 300.ms,
                      margin: EdgeInsets.symmetric(vertical: 3),
                      width: selected ? 13 : 10,
                      height: selected ? 13 : 10,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: selected
                                    ? Color(0xff0183FF).withOpacity(0.5)
                                    : Colors.black.withOpacity(0.1),
                                offset: Offset(1, 3),
                                blurRadius: 8)
                          ],
                          color: selected ? Color(0xff0183FF) : Colors.white,
                          shape: BoxShape.circle),
                    );
                  }),
                  Assets.icons.arrowDown.image(),
                ],
              )),
        ],
      ),
    );
  }
}
