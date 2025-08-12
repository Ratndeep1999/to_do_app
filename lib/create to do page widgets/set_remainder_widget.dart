import 'package:flutter/material.dart';

class SetRemainderWidget extends StatelessWidget {
  final bool isRemainder;
  final Function(bool) activeRemainder ;

  const SetRemainderWidget({super.key, required this.isRemainder, required this.activeRemainder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory, // Disables the splash effect
      onTap: () {
        // Toggle the remainder state
        activeRemainder(!isRemainder);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isRemainder ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black26, width: 1.5),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Set Reminder',
              style: TextStyle(
                color: isRemainder ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),

            Icon(
              isRemainder ? Icons.notifications_active : Icons.notifications,
              size: 20,
              color: isRemainder ? Colors.white : Colors.black, // White when active, black when inactive
            ),
          ],
        ),
      ),
    );
  }
}
