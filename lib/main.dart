
import 'package:flutter/material.dart';
import 'package:mechat/Chat.dart';
import 'package:mechat/Home.dart';

import 'BackgroundTask.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const UI(),
      "/chat": (context) => const Chat(),
      "/launch": (context) => const Home(),
    },
  ));
}

class UI extends StatefulWidget {
  const UI({key}) : super(key: key);

  @override
  _UIState createState() => _UIState();
}



class _UIState extends State<UI> {

  Background bg = Background();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  Future<Map<String, dynamic>> fetchData() async{
    List<Map<String, dynamic>> data = await bg.getData();
    return data[0];
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:5), () {
      Navigator.pushReplacementNamed(context, "/launch", arguments: {
        "dbData": bg.getData()
      });
    });
    return const SafeArea(
      child: Scaffold(
        body: Text("data"),
      ),
    );
  }
}
