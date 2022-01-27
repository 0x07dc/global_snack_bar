import 'package:flutter/material.dart';
import 'package:global_snack_bar/global_snack_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Snack Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Global Snack Bar Example'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String snackBarLabel = 'Hello, Snackers!';
  String snackBarActionLabel = 'Touch me';
  String hello = 'Hello, World';
  String goodbye = 'Goodbye, World';
  String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GlobalMsgWrapper(
        Center(
          child: Text(message ?? hello),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GlobalSnackBarBloc.showSnackBar(
            SnackBar(
              content: Text(snackBarLabel),
              margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
              backgroundColor: Colors.teal,
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: snackBarActionLabel,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    message = message == hello ? goodbye : hello;
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
