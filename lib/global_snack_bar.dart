library global_snack_bar;

import 'dart:async';

import 'package:flutter/material.dart';

/// Provides a universal snack bar
/// Must be a child of a scaffold
/// Simply wrap the content with [GlobalMsgWrapper]
class GlobalMsgWrapper extends StatefulWidget {
  Widget content;
  GlobalMsgWrapper(this.content);

  @override
  _GlobalMsgWrapperState createState() => _GlobalMsgWrapperState();
}

class _GlobalMsgWrapperState extends State<GlobalMsgWrapper> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await for (var message in GlobalSnackBarBloc.newMessage) {
        showSnackBar(message);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showSnackBar(GlobalMsg msg) {
    SnackBar bar = SnackBar(
      content: Text(msg.text),
      backgroundColor: msg.bgColor,
    );

    ScaffoldMessenger.of(context)
      //..hideCurrentSnackBar()
      ..showSnackBar(bar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.content;
  }
}

class GlobalMsg {
  GlobalMsg(this.text, {this.bgColor});
  String text = "";
  Color bgColor = Colors.teal;
}

class GlobalSnackBarBloc {
  static final streamController =
      StreamController(); // create a StreamController or
  // final counterController = PublishSubject() or any other rxdart option;
  static Stream get newMessage =>
      streamController.stream; // create a getter for our Stream
  // the rxdart stream controllers returns an Observable instead of a Stream

  static void showMessage(GlobalMsg data) {
    streamController.sink.add(data); // add whatever data we want into the Sink
  }
}
