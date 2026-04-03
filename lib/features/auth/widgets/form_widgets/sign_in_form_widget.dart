import 'package:flutter/material.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/button_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/password_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/username_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/label_widgets/label_widget.dart';
import 'package:to_do_app/features/auth/widgets/label_widgets/sub_label_widget.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/text_button_widget.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
    required this.userNameController,
    required this.passwordController,
    required this.onTogglePassword,
    required this.onSignInPress,
    required this.onNavigate,
    this.onPassChanged,
    required this.isPassVisible,
    required this.formKey,
  });

  final TextEditingController userNameController, passwordController;
  final VoidCallback onTogglePassword, onSignInPress, onNavigate;
  final Function(String?)? onPassChanged;
  final bool isPassVisible;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            LabelWidget(label: 'SIGN in'),
            SizedBox(height: height * 0.025),

            /// Username
            UsernameFieldWidget(
              controller: userNameController,
              prefix: Icons.verified_user,
            ),
            SizedBox(height: height * 0.025),

            /// Password
            PasswordFieldWidget(
              controller: passwordController,
              isPassVisible: isPassVisible,
              onToggle: onTogglePassword,
              onChanged: onPassChanged,
              prefix: Icons.password,
            ),
            SizedBox(height: height * 0.025),

            ButtonWidget(onButtonPress: onSignInPress, label: "Sign In"),
            SizedBox(height: height * 0.075),

            SubLabelWidget(label: 'If you are new here then click on'),

            /// Button
            TextButtonWidget(onTap: onNavigate, label: "Sign up"),
          ],
        ),
      ),
    );
  }
}
