import 'package:flutter/material.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/button_widget.dart';
import 'package:to_do_app/features/auth/widgets/button_widgets/text_button_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/email_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/full_name_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/password_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/phone_no_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/field_widgets/username_field_widget.dart';
import 'package:to_do_app/features/auth/widgets/label_widgets/sub_label_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
    required this.formKey,
    required this.fullnameCont,
    required this.usernameCont,
    required this.emailCont,
    required this.mobileNoCont,
    required this.passwordCont,
    required this.onSignUpPress,
    required this.onTogglePassword,
    required this.onNavigate,
    this.onPassChanged,
    required this.isPassVisible,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController fullnameCont, usernameCont, emailCont;
  final TextEditingController mobileNoCont, passwordCont;
  final VoidCallback onSignUpPress, onTogglePassword, onNavigate;
  final Function(String?)? onPassChanged;
  final bool isPassVisible;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            /// FullName
            FullNameFieldWidget(controller: fullnameCont),
            SizedBox(height: height * 0.025),

            /// Username
            UsernameFieldWidget(
              controller: usernameCont,
              icon: Icons.verified_user,
            ),
            SizedBox(height: height * 0.025),

            /// Email
            EmailFieldWidget(controller: emailCont),
            SizedBox(height: height * 0.025),

            /// Phone no.
            PhoneNoFieldWidget(controller: mobileNoCont),
            SizedBox(height: height * 0.025),

            /// Password
            PasswordFieldWidget(
              controller: passwordCont,
              icon: Icons.password,
              isPassVisible: isPassVisible,
              onToggle: onTogglePassword,
              onChanged: onPassChanged,
            ),
            SizedBox(height: height * 0.025),

            /// SignUp Button
            ButtonWidget(onButtonPress: onSignUpPress, label: "Sign Up"),
            SizedBox(height: height * 0.075),

            SubLabelWidget(label: 'If you already have account then click on'),

            /// SignUp Label
            TextButtonWidget(onTap: onNavigate, label: "Sign in"),
          ],
        ),
      ),
    );
  }
}
