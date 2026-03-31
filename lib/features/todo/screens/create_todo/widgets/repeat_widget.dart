import 'package:flutter/material.dart';
import 'chip_widget.dart';

class RepeatWidget extends StatelessWidget {
  const RepeatWidget({
    super.key,
    required this.repeatData,
    required this.selectedChip,
    required this.onSelect,
  });

  final List repeatData;
  final String selectedChip;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: MediaQuery.of(context).size.height * 0.012,
      spacing: MediaQuery.of(context).size.width * 0.03,
      children: List.generate(repeatData.length, (int index) {
        final item = repeatData[index];
        return ChipWidget(
          title: item,
          isSelected: (selectedChip == item),
          onSelect: onSelect,
        );
      }),
    );
  }
}
