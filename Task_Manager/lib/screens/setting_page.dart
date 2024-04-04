// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:task_manager/Helpers/Database.dart';
import 'home.dart';
import 'right_icon.dart';
import 'package:toast/toast.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

showAlertDialog(BuildContext context) async {
  // set up the buttons
  // ignore: deprecated_member_use
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // ignore: deprecated_member_use
  Widget continueButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      DatabaseHelper.instance.deleteAllTask();
      Toast.show("All data cleared",
          duration: Toast.lengthLong, gravity: Toast.bottom);
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content:
        const Text("Would you like to clear all data? It cannot be undone."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()))),
        title: const Row(children: [
          Text(
            'Settings',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ]),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const StakedIcons(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Task Manager",
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 20.0, bottom: 60.0),
                child: Container(
                    alignment: Alignment.center,
                    child: const Text("Version: 3.0.0",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey))),
              ),
              const SizedBox(
                width: 1080,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 40.0, right: 20.0, bottom: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: const Text("CLEAR ALL DATA",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.white))),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
