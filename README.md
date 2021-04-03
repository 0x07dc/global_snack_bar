# global_snack_bar

Provides class for global snack bar

## How to use

```
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
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GlobalMsgWrapper(
        Center(
          child: Text("Hello, World"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GlobalSnackBarBloc.showMessage(
            GlobalMsg("hello", bgColor: Colors.cyanAccent),
          );
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}

```