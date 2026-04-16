import 'package:flutter/material.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/login_signup/form_divider.dart';
import 'package:t_store/common/widgets/login_signup/social_buttons.dart';

import 'widgets/login_header.dart';
import 'widgets/login_form.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              TLoginHeader(),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(
                dividerText: TTexts.orSignInWith,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Footer
              TSocialButtons(),

              SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
