import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/constants/app_text_styles.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  });

  final String title;
  final bool isSelected;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(title),
      splashColor: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black26),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

          /// Title
          child: Text(
            title,
            style: AppTextStyles.kChipLabel.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
