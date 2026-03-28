import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function(String) onSelect;

  const CustomChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(title); // String value pass to parent class
      },
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black26),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
