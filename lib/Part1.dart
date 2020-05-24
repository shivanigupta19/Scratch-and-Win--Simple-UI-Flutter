  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

class Part1 extends StatefulWidget {
  @override
  _Part1State createState() => _Part1State();
}

class _Part1State extends State<Part1> {

  AssetImage blank = AssetImage("images/blank.png");
  AssetImage rupee = AssetImage("images/rupee.png");
  AssetImage sad = AssetImage("images/sad.png");

  List<String> arr;
  int luckyNumber;
  String message = "";
  int counter = 0;
  int money = 200;
  int prize = 25;

  @override
  void initState() {
    super.initState();
     arr = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber(){
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;

    });

  }
  
   delay(){
    Future.delayed(const Duration(milliseconds: 5000),(){
      setState(() {
        this.resetGame();
        counter = 0;
      });
    });
  }


  AssetImage getImage(int index)
  {
    String currentImage = arr[index];
    switch(currentImage)
    {
       case "rupee":
       return rupee;
       break;
       case "sad":
       return sad;
       break;
    }
 return blank;

  }

   displayMessage(){
    setState(() {
      message = "You have reached maximum tries";  
      delay();
    });
  }


  playGame(int index){
    if(luckyNumber == index)
    setState(() {
      arr[index] = "rupee";
      prize = prize + money;

      this.message = "hey! you got Rs $prize";
      delay();

    });
    else if(luckyNumber != index && counter <= 5){
      setState(() {
        arr[index] = "sad";
        money = money - 5; 
      });
    }
     if(counter == 5){
        displayMessage();
      }

  }

  showAll()
  {
       setState(() {
       arr = List<String>.filled(25, "sad");
       arr[luckyNumber] = "rupee";
    });
  }

  resetGame(){
    setState(() {
       arr = List<String>.filled(25, "empty");
       this.message = "";
       this.counter = 0;
    });
     generateRandomNumber();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       Expanded(
         child:  GridView.builder(
             padding: EdgeInsets.all(10.0),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 5,
               childAspectRatio: 1.0,
               mainAxisSpacing: 5.0,
               crossAxisSpacing: 5.0
             ), 
             itemCount: this.arr.length,
             itemBuilder: (context , i) => SizedBox(
               width: 300,
               height: 300,
               child: MaterialButton(
                 onPressed: (){
                   this.playGame(i);
                 },
                 child: Image(
                   image: this.getImage(i),
                   ),
               ),
             ), 
             ),
             ),

                Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(this.message, style: TextStyle(color: Colors.black,
                   fontStyle: FontStyle.italic,fontSize: 25.0)),
              ),
            ],
          ),
           
            Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blueAccent.shade700,
                    child: Text("Reset All", style: TextStyle(color: Colors.white, 
                    fontStyle: FontStyle.italic,fontSize: 15.0),),
                    onPressed: (){
                      this.resetGame();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blueAccent.shade700,
                    child: Text("Show All", style: TextStyle(color: Colors.white,
                     fontStyle: FontStyle.italic,fontSize: 15.0),),
                    onPressed: (){
                      this.showAll();
                    },
                  ),
                ),
                Container(
                   padding: EdgeInsets.all(5),

                  child: Text(
                    'LearnCodeOnline.in',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),

                 Container(
                   padding: EdgeInsets.all(5),
                  child: Text(
                    'Developed by Shivani Gupta',
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
    ),
      ]
    );
    
  }
}