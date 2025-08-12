import 'package:flutter/material.dart';
import 'package:to_do_app/create_to_do_list_page.dart';
import 'package:to_do_app/to_do_model_class.dart';
import 'to do list page widgets/to_do_list_item.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<ToDoModel> toDoList = [];

  @override
  Widget build(BuildContext context) {
    debugPrint('build Called');
    return Scaffold(
      backgroundColor: Colors.white,

      /// Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ToDoModel? data = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateToDoListPage()),
          ) as ToDoModel? ;

          // if data is not null then add it int to toDoList as List_items
          if (data != null) {
            setState(() {
              toDoList.add(data);
            });
          }
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
                  // Today
                  const Text(
                    'Today',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  // Filter button
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
                        const Text(
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
                  itemCount: toDoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    debugPrint('Item : $index');
                    return ToDoListItem(index: index, item: toDoList[index],);
                  },
                  // It separate item with separator but not at last item
                  separatorBuilder: (context, index) {
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

