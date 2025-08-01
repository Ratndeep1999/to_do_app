import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        actions: [
          Text(
            'DO',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
          ),
          Spacer(),
          Icon(Icons.menu, size: 35),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              /// Today Filter section
              Row(
                children: [
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),

                  Container(
                    height: 45,
                    width: 110,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(width: 2, color: Colors.black12),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Filter ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Icon(Icons.filter_alt),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              /// List section
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: BoxBorder.all(width: 2, color: Colors.blue),
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
                          'Return Library Books',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Description
                        Text(
                          'Gather overdue library books and return Gather overdue library books and return',
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
                            Icon(Icons.notifications, size: 18),

                            SizedBox(width: 12),

                            // Refresh
                            Icon(Icons.repeat, size: 18),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
