import 'package:flutter/material.dart';
import 'package:to_do_app/create_to_do_list_page.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateToDoListPage()),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.027),

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              /// ListView section
              Expanded(
                child: ListView.separated(
                  itemCount: 1000,
                  itemBuilder: (BuildContext context, index) => Row(
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
                          visible: index.isEven,
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
                                Text(
                                  '11:30 AM',
                                  style: TextStyle(fontSize: 13),
                                ),

                                SizedBox(width: 12),

                                // Date
                                Icon(Icons.calendar_today_rounded, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  '26/11/2024',
                                  style: TextStyle(fontSize: 12),
                                ),

                                SizedBox(width: 12),

                                // Notification
                                Icon(Icons.notifications, size: 18),

                                SizedBox(width: 12),

                                // Refresh
                                Icon(Icons.repeat, size: 18),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // It separate item with separator but not at last item
                  separatorBuilder: (context, index) {
                    debugPrint(index.toString());
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
