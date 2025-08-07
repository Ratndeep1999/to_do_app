import 'package:flutter/material.dart';

class SetRemainderWidget extends StatelessWidget {
  const SetRemainderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Set Reminder',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Icon(Icons.notifications, size: 18),
          ],
        ),
      ),
    );
  }
}