import 'package:flutter/material.dart';
import 'package:mechat/BackgroundTask.dart';
import 'package:mechat/Chat.dart';
import 'package:mechat/main.dart';

import 'DatabaseHelper.dart';



class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var textList = [
    "Schatz <3",
    "Diker Affe",
    "Päthär",
    "Pamina",
    "Turboooo",
    "Baran",
    "Michi",
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




  Color aPurple = const Color(0xffAB2346);
  Color eBlack = const Color(0xff191516);
  Color skobeloff = const Color(0xff297373);
  Color dss = const Color(0xff4A6C6F);
  Color bPowder = const Color(0xffFFFFFA);

  
  Background bg = Background();
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("HALLOOOOOO");
  }


  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    print(data);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //testInsert(textList);
          },
          backgroundColor: skobeloff,
          child: const Icon(Icons.add),
        ),
        backgroundColor: eBlack,
        body: Column(
          children: [
            Container(
              
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "MeChat",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(
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
              color: aPurple,
              height: 50,
              width: double.infinity,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: textList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        child: oneChat(index),
                        onTap: () {
                          print(textList[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat(namePassed: textList[index])
                              )
                            );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


void testInsert(List textList)async{
  String encoded = await Background().generateProPic();
    
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "Schatz <3",
      DatabaseHelper.columnProPic: encoded
    };
    DatabaseHelper.instance.insert(row);
  print(await DatabaseHelper.instance.queryAllRows());
}

Widget oneChat(int index){
  
  
  
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
            radius: 25, backgroundImage: AssetImage("assets/anon.png")),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 5,
            ),
            Text("LOOL",
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
