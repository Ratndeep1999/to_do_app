import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onButtonPress,
    required this.label,
  });

  final VoidCallback onButtonPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.bottomRight,
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: onButtonPress,
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerRight,
            backgroundColor: Colors.black54,
            elevation: 4.0,
            shadowColor: Colors.black,
          ),
          child: Text(label, style: AppTextStyles.kAuthButtonLabel),
        ),
      ),
    );
  }
}
