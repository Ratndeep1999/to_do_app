import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_model_class.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({super.key, required this.index, required this.item});

  final int index;
  final ToDoModel item;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {

  // Calculations happen once, not every build() call.
  // Cleaner build() method.
  @override
  void initState() {
    super.initState();
    widget.item.createDateTime.hour;
  }

  // Method to return time in 12 hours format
  int getTime() {
    if (widget.item.createDateTime.hour > 12) {
      return widget.item.createDateTime.hour - 12;
    } else {
      return widget.item.createDateTime.hour;
    }
  }
  // Method to return AM and PM
  String getAmPm() {
    if (widget.item.createDateTime.hour > 12) {
      return 'PM';
    } else {
      return 'AM';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Blue Circle
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            widget.item.isTaskCompleted = !widget.item.isTaskCompleted;
            setState(() {});
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.blue),
              color: widget.item.isTaskCompleted
                  ? Colors.blue
                  : Colors.transparent,
            ),
            child: Visibility(
              visible: widget.item.isTaskCompleted,
              child: Icon(Icons.check, size: 25),
            ),
          ),
        ),
        SizedBox(width: 10),

        /// Title and Description of List
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.005),
              //Title
              Text(
                widget.item.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              // Description
              Text(
                widget.item.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 2),

              /// Time, Date, Notification, Refresh
              Row(
                children: [
                  // Time
                  Icon(Icons.watch_later_outlined, size: 18),
                  SizedBox(width: 2),
                  Text(
                    '${getTime().toString().padLeft(2, '0')}:${widget.item.createDateTime.minute.toString().padLeft(2, '0')} ${getAmPm()}',
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(width: 12),

                  // Date
                  Icon(Icons.calendar_today_rounded, size: 16),
                  SizedBox(width: 5),
                  Text(
                    '${widget.item.createDateTime.day}/${widget.item.createDateTime.month}/${widget.item.createDateTime.year}',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(width: 12),

                  // Notification
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.item.isRemaindered = !widget.item.isRemaindered;
                      });
                    },
                    child: Icon(
                      widget.item.isRemaindered
                          ? Icons.notifications_active_sharp
                          : Icons.notifications,
                      size: 18,
                    ),
                  ),

                  SizedBox(width: 12),

                  // Refresh
                  Icon(Icons.repeat, size: 18),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      ],
    );
  }
}

// // Method to return time in 12 hours format
// String getHours() {
//   int hour = widget.item.createDateTime.hour;
//   int displayHour = hour > 12 ? hour - 12 : hour;
//   return displayHour.toString().padLeft(2, '0');
// }
//
// // Method to return minutes in two-digit format
// String getMinutes() {
//   return widget.item.createDateTime.minute.toString().padLeft(2, '0');
// }
