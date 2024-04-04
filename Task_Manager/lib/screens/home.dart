// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/helpers/Database.dart';
import 'package:task_manager/models/Task-Models.dart';
import 'history_page.dart';
import 'package:task_manager/screens/add_tpage.dart';
import 'package:intl/intl.dart';
import 'setting_page.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          if (task.status == 0)
            ListTile(
              title: Text(
                task.title!,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              subtitle: Text(
                '${_dateFormatter.format(task.date!)} • ${task.priority}',
                style: TextStyle(
                  fontSize: 15.0,
                  decoration: task.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              trailing: Checkbox(
                onChanged: (value) {
                  // task.status = value ? 1 : 0;
                  DatabaseHelper.instance.updateTask(task);
                  Toast.show("Task Completed",
                      duration: Toast.lengthLong, gravity: Toast.bottom);
                  _updateTaskList();
                },
                activeColor: Theme.of(context).primaryColor,
                value: task.status == 1 ? true : false,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTaskScreen(
                    updateTaskList: _updateTaskList,
                    task: task,
                  ),
                ),
              ),
            ),
          //Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add_outlined),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AddTaskScreen(
              updateTaskList: _updateTaskList,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Task Manager",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.all(0),
            child: IconButton(
                icon: const Icon(Icons.history_outlined),
                iconSize: 25.0,
                color: Colors.black,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HistoryScreen()))),
          ),
          Container(
            margin: const EdgeInsets.all(6.0),
            child: IconButton(
                icon: const Icon(Icons.settings_outlined),
                iconSize: 25.0,
                color: Colors.black,
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Settings()))),
          )
        ],
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final int completedTaskCount = snapshot.data!
              .where((Task task) => task.status == 0)
              .toList()
              .length;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            itemCount: 1 + snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        padding: const EdgeInsets.all(10.0),
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color.fromRGBO(240, 240, 240, 1.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Text(
                            'You have [ $completedTaskCount ] pending task out of [ ${snapshot.data!.length} ]',
                            style: const TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return _buildTask(snapshot.data![index - 1]);
            },
          );
        },
      ),
    );
  }
}
