import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class HeaderFilterWidget extends StatelessWidget {
  const HeaderFilterWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Today
        Text(title, style: AppTextStyles.kTodayLabel),
        Spacer(),

        /// Filter Button
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SizedBox(
            height: 40,
            width: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Label
                  Text(
                    "Filter",
                    style: AppTextStyles.kTodayLabel.copyWith(fontSize: 16),
                  ),

                  /// Label
                  const Icon(Icons.filter_alt, size: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
