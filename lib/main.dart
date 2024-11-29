import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/common/gen/assets.gen.dart';
import 'package:mobileshop/common/navigation/navigation_flow.dart';
import 'package:mobileshop/common/providers/providers.dart';
import 'package:mobileshop/common/widgets/auth_background.dart';
import 'package:mobileshop/common/widgets/loading_widget.dart';
import 'package:mobileshop/config/config.dart';
import 'package:mobileshop/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await setup();
  await EasyLocalization.ensureInitialized();
  runApp(ProviderScope(
    overrides: await getOverrides(),
    child: EasyLocalization(
        supportedLocales: const [Locale('fa', 'IR')],
        path: 'assets/translations',
        fallbackLocale: const Locale('fa', 'IR'),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: config['theme'],
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
    );
  }
}

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        await Future.delayed(2.seconds);
        final token = ref.read(sharedPreferencesProvider).getString('token');
        if (token != null) {
          NavigationFlow.toProductList();
        } else {
          NavigationFlow.toWelcomePage();
        }
      });
    }, []);
    return AuthBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Assets.images.logo.image().animate().fadeIn(),
          ),
        ),
        Spacer(),
        LoadingWidget(),
        32.heightBox,
      ],
    ));
  }
}

class WelComePage extends HookConsumerWidget {
  const WelComePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Assets.images.welcomePageImage.image()),
                Expanded(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Assets.images.logo.image(),
                    ),
                    Text(
                      'gamino_shop'.tr(),
                      style: context.textTheme.labelLarge,
                    ),
                    12.heightBox,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      child: Text('welcome_page_description'.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelMedium!
                              .copyWith(color: Color(0xff676767))),
                    ),
                    Spacer(),
                    SizedBox(
                      width: context.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {
                          NavigationFlow.toSignUpPage();
                        },
                        child: Text(
                          'create_account'.tr(),
                          style: context.textTheme.displayLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                        .animate()
                        .slideY(
                          begin: -1,
                          duration: 300.ms,
                        )
                        .fadeIn(),
                    TextButton(
                            onPressed: () {
                              NavigationFlow.toLoginPage();
                            },
                            child: Text(
                              'sign_up_before'.tr(),
                              style: context.textTheme.displaySmall!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ))
                        .animate()
                        .slideY(
                          begin: 1,
                          duration: 300.ms,
                        )
                        .fadeIn(),
                    8.heightBox,
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
