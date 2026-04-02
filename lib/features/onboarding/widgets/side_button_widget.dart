import 'package:flutter/material.dart';

class SideButtonWidget extends StatelessWidget {
  const SideButtonWidget({super.key, required this.onTap, this.isLeft});

  final VoidCallback onTap;
  final bool? isLeft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      child: SizedBox(
        height: 40,
        width: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Transform.rotate(
            angle: (isLeft ?? false) ? 1 : 0,
            child: Icon(Icons.play_arrow, size: 24),
          ),
        ),
      ),
    );
  }
}
