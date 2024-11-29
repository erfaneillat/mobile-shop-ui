import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';
import 'package:mobileshop/common/gen/assets.gen.dart';
import 'package:mobileshop/common/navigation/navigation_flow.dart';
import 'package:mobileshop/common/platform/async_operation.dart';
import 'package:mobileshop/common/providers/providers.dart';
import 'package:mobileshop/common/widgets/auth_background.dart';
import 'package:mobileshop/common/widgets/custom_text_field.dart';
import 'package:mobileshop/common/widgets/loading_widget.dart';
import 'package:mobileshop/router/router.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './../domain/providers/auth_provider.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    void onLogin() async {
      if (formKey.currentState!.saveAndValidate()) {
        final data = formKey.currentState!.value;
        ref.read(authProvider.notifier).login(data['email'], data['password']);
      }
    }

    ref.listen(authProvider, (_, n) async {
      if (n.isData) {
        final token = n.data.value;
        await ref.read(sharedPreferencesProvider).setString('token', token);
        NavigationFlow.toProductList();
      }
      if (n.isError) {
        context.showMessage(n.errorMessage ?? '', SnackBarType.error);
      }
    });
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 42, vertical: keyboardIsOpen ? 4 : 16),
          child: SafeArea(
              child: SizedBox(
            width: double.infinity,
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 32),
                          child: Assets.images.logo.image(),
                        ),
                      ),
                      Expanded(flex: 2, child: Assets.images.login.image()),
                    ],
                  )),
                  keyboardIsOpen ? 12.heightBox : 24.heightBox,
                  Expanded(
                    flex: keyboardIsOpen ? 2 : 1,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'info@example.com',
                          name: 'email',
                          title: 'email'.tr(),
                          validator: FormBuilderValidators.email(
                              errorText: 'email_error'.tr()),
                        ),
                        keyboardIsOpen ? 7.heightBox : 14.heightBox,
                        CustomTextField(
                          hintText: 'password_hint'.tr(),
                          obscureText: true,
                          name: 'password',
                          title: 'password'.tr(),
                          validator: FormBuilderValidators.minLength(5,
                              errorText: 'password_min_error'.tr()),
                        ),
                        Spacer(),
                        Flexible(
                            child: SizedBox(
                                    width: double.infinity,
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final state = ref.watch(authProvider);
                                        return ElevatedButton(
                                          onPressed:
                                              state.isLoading ? null : onLogin,
                                          child: state.isLoading
                                              ? LoadingWidget()
                                              : Text(
                                                  'login'.tr(),
                                                  style: context
                                                      .textTheme.displayLarge!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                        );
                                      },
                                    ))
                                .animate()
                                .slideY(
                                  begin: -1,
                                  duration: 300.ms,
                                )
                                .fadeIn()),
                        Flexible(
                            child: TextButton(
                                    onPressed: () {
                                      router.replace('/sign_up');
                                    },
                                    child: Text(
                                      'create_account'.tr(),
                                      style: context.textTheme.displaySmall!
                                          .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ))
                                .animate()
                                .slideY(
                                  begin: 1,
                                  duration: 300.ms,
                                )
                                .fadeIn()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
