import 'package:flutter/material.dart';
import 'chip_widget.dart';

class SelectableChipsWidget extends StatelessWidget {
  const SelectableChipsWidget({
    super.key,
    required this.repeatData,
    required this.onSelect,
    this.selectedChip,
    this.selectedChips,
  });

  final List repeatData;
  final Function(String) onSelect;
  final String? selectedChip;
  final Set<String>? selectedChips;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: MediaQuery.of(context).size.height * 0.012,
      spacing: MediaQuery.of(context).size.width * 0.03,
      children: List.generate(repeatData.length, (int index) {
        /// Single Chip Item
        final item = repeatData[index];

        /// Check Single or Multi Chip
        final isSelected = selectedChips != null
            ? selectedChips!.contains(item)
            : (selectedChip == item);
        return ChipWidget(
          title: item,
          isSelected: isSelected,
          onSelect: onSelect,
        );
      }),
    );
  }
}
