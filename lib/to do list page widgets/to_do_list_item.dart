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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Dynamic Blue Circle
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.blue),
          ),
          child: Visibility(
            visible: widget.index.isEven,
            child: Icon(Icons.check, size: 25),
          ),
        ),
        SizedBox(width: 10),

        /// Title and Description of List
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Text('11:30 AM', style: TextStyle(fontSize: 13)),

                  SizedBox(width: 12),

                  // Date
                  Icon(Icons.calendar_today_rounded, size: 16),
                  SizedBox(width: 5),
                  Text('26/11/2024', style: TextStyle(fontSize: 12)),

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ],
    );
  }
}
