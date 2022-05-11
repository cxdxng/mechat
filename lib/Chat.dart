import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mechat/BackgroundTask.dart';

class Chat extends StatefulWidget {
  final String namePassed;
  const Chat({ Key key , this.namePassed}) : super(key: key);



  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  
  Color aPurple = const Color(0xffAB2346);
  Color eBlack = const Color(0xff191516);
  Color skobeloff = const Color(0xff297373);
  Color dss = const Color(0xff4A6C6F);
  Color bPowder = const Color(0xffFFFFFA);


  List msgs = ["START OF CONVERSATION"];
  List time = ["00:00"];
  TextEditingController ctrl = TextEditingController();
  ScrollController scrollController = ScrollController();

  Background bg = Background();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: eBlack,
          title: Row(
            children: [
              const CircleAvatar(radius: 20, backgroundImage: AssetImage("assets/anon.png")),
              const SizedBox(width: 10),
              Text(widget.namePassed),
              
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/wp.jpeg"), fit: BoxFit.cover,),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: msgs.length,
                    itemBuilder: (BuildContext context, int index){
                      return createMessage(index, dss);
                    }
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: ctrl,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              fillColor: Colors.white,
                              hintText: "Nachicht",
                              filled: true,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          
                          style: TextButton.styleFrom(
                            backgroundColor: skobeloff,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(15)
                          ),
                          onPressed: (){
                            setState(() {
                              sendMsg();
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                              bg.generateProPic();
                            });
                          }, 
                          child: const Icon(Icons.send_rounded, color: Colors.white,)
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            
            
          ],
        ),
      ),
    );
    
  }
  


  void sendMsg(){
    String now = DateFormat("kk:mm").format(DateTime.now());
    msgs.add(ctrl.text);
    time.add(now);
  }

  Padding createMessage(int index, Color col){
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 0, 70, 3),
      child: Card(
        color: col,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                msgs[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
              Text(time[index])
            ],
          ),
        ),
      ),
    );
  }
}