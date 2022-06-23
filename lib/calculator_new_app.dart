import 'package:calculator/memory.dart';
import 'package:calculator/new_containar.dart';
import 'package:flutter/material.dart';


const Color bacgroundDark=Color(0xff374352);
const Color bacgroundLight=Color(0xffe6eeff);
const Color textcolorlight=Colors.deepOrangeAccent;

class CalculatorNewApp extends StatefulWidget {
  const CalculatorNewApp({Key? key}) : super(key: key);

  @override
  State<CalculatorNewApp> createState() => CalculatorNewAppState();
}

class CalculatorNewAppState extends State<CalculatorNewApp> {

  final Memory memory = Memory();

  late double index;
  bool darkmode=false;
  String displayList="";
  bool compress=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: darkmode? bacgroundDark:bacgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130),
                child: GestureDetector(
                    onTap: (){
                      setState((){
                        darkmode ? darkmode=false: darkmode=true;
                      });

                    },
                    child: _checkWidget()),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color:darkmode?Colors.white:Colors.deepOrangeAccent),),
                      Expanded(

                          child: Text(memory.value,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color:darkmode?Colors.white:Colors.red),)),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(memory.history,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey.shade400),maxLines: 3,),
                ],
              ),

              Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _roundadButton(title: "AC",iconColor:darkmode?Colors.green: Colors.red),
                          _roundadButton(title: "C",iconColor:darkmode?Colors.green: Colors.red),
                          _roundadButton(title: "%",iconColor:darkmode?Colors.green: Colors.red),
                          _roundadButton(title: "/",iconColor:darkmode?Colors.green: Colors.red),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _roundadButton(title: "7"),
                          _roundadButton(title: "8"),
                          _roundadButton(title: "9"),
                          _roundadButton(title: "X",iconColor:darkmode?Colors.green: Colors.red),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _roundadButton(title: "4"),
                          _roundadButton(title: "5"),
                          _roundadButton(title: "6"),
                          _roundadButton(title: "-",iconColor:darkmode?Colors.green: Colors.red),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _roundadButton(title: "1"),
                          _roundadButton(title: "2"),
                          _roundadButton(title: "3"),
                          _roundadButton(title: "+",iconColor:darkmode?Colors.green: Colors.red),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _roundadButton(title: "0"),
                          _roundadButton(title: "."),
                          _roundadButton(title: "00"),
                          _roundadButton(title: "=",iconColor: darkmode?Colors.green: Colors.red),
                        ],
                      ),
                    ),


                  ],

                )
              ),
            ],
          ),
        ),
      ),
    );
  }
 Widget _roundadButton({ String? title,padding = 17.0,IconData? iconData,Color? iconColor}){
    return GestureDetector(
      onTap: (){
        String holdopparetor="";
        setState(() {

            memory.applyCommand(title.toString());










        });

      },
      child: NewContainer(darkmood: darkmode,padding: EdgeInsets.all(padding),borderRadius: BorderRadius.circular(40),child: Container(
        height: padding*2,
        width: padding*2,


        child: Center(
            child: title!=null? Text(title,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:iconColor!= null? iconColor:darkmode?Colors.white:Colors.black),):Icon(iconData,color: iconColor),

        ),


      ),),
    );

 }
 Widget _checkWidget(){

    return  NewContainer(darkmood: darkmode,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        borderRadius: BorderRadius.circular(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.sunny,size: 20,color:darkmode? Colors.blueGrey:Colors.yellow),
            Icon(Icons.nightlight,size: 20,color:darkmode? Colors.blue.shade400:Colors.blueGrey,),
          ],

        ),


      );
 }



}
