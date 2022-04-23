// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => const UI(),
    },
  ));
}

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  var textList = [
    "Schatz <3",
    "Diker Affe",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
    "Päthär",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        backgroundColor: const Color(0xff23374D),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MeChat",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              color: Color(0xff0085ff),
              height: 50,
              width: double.infinity,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: textList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        child: oneChat(textList[index]),
                        onTap: () {
                          print(textList[index]);
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget oneChat(String name) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 25, backgroundImage: AssetImage("assets/anon.png")),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text(
              "Boah das ist voll der diiike TExt",
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ],
    ),
  );
}
