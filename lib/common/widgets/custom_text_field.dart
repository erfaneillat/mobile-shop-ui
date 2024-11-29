import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobileshop/common/extensions/context.dart';
import 'package:mobileshop/common/extensions/int.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.name,
    required this.hintText,
    required this.title,
    this.validator,
    this.obscureText = false,
  });
  final String name;
  final String hintText;
  final String title;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelMedium,
        ),
        8.heightBox,
        FormBuilderTextField(
          name: name,
          validator: validator,
          style: context.textTheme.labelMedium,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            fillColor: Colors.white,
            border: InputBorder.none,
            errorStyle: context.textTheme.displaySmall!
                .copyWith(color: context.colorScheme.error),
            hintStyle: context.textTheme.displaySmall!
                .copyWith(color: Color(0xffc4c4c4)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.circular(100),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error),
              borderRadius: BorderRadius.circular(100),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
