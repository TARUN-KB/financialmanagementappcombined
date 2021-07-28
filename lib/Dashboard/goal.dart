import 'package:flutter/material.dart';
import 'package:fincancialmanagement_combined/Dashboard/dashboard.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: goal(),
  )));
}

class goal extends StatefulWidget {


  @override
  _goalState createState() => _goalState();
}

class _goalState extends State<goal> {
  List<String> Months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  int _counter=0;
  int _currentindex=0;
  String goalname="Watch";
  final List<String> goallist=<String>
  ["Watch","Phone","Car","Bike"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('reach',style: TextStyle(fontSize: 45,fontFamily: 'teko'),),
          centerTitle: true,


        ),


        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.grey[350],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text("Your Goals",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("Goal Name",style: TextStyle(fontSize: 20,)),
                    DropdownButton<String>(

                      value: goalname,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      //isExpanded: true,
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (newValue) {
                        setState(() {
                          goalname = newValue!;
                        });
                      },
                      /*validator: (String newvalue){
                              if(newvalue.isEmpty)
                              {
                                return 'Please enter phone no ';
                              }
                              return null;
                            },*/
                      items: goallist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black
                            ),),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  height: 25,
                  width: 250,
                  child: ElevatedButton(onPressed: (){
                    alert(context);
                  },

                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent),

                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            )
                        )
                    ), child: null,

                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      if(_counter!=0)
                      {
                        _counter-=1;
                      }
                      else{
                        _counter=11;
                      }
                    });
                  },
                      icon: Icon(Icons.arrow_left,color: Colors.blue[900],size: 35,))  ,

                  Text(Months[_counter],style: TextStyle(color: Colors.blue[900],fontSize: 20),),

                  IconButton(onPressed: (){
                    setState(() {
                      if(_counter!=11)
                      {
                        _counter+=1;
                      }
                      else{
                        _counter=0;
                      }
                    });
                  },
                      icon: Icon(Icons.arrow_right,color: Colors.blue[900],size: 35,))  ,
                ],
              ),
              Image.asset("images/fingraph.jpg"),

              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: (){
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      //side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("New Payment",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),

                  ),
                ), ),

              SizedBox(height: 20,),
              Center(child: Image.asset("images/piechart.jpg")),
              SizedBox(height: 20,),
              Text("Transaction History",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 10,),
                 Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: (){
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      //side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("New Payment",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),

                  ),
                ), ),
              SizedBox(height: 15,)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          backgroundColor: Colors.blue[900],
          child: Icon(Icons.add),
        ),

      ),
    );
  }
}

void alert(BuildContext context)
{
  var alertbox=AlertDialog(
    //title: Text("Alert Dialog"),
    content: Text("1000 left to spend"),
    actions: [
      ElevatedButton(onPressed: (){
        //final wordpair=WordPair(Random());
        Navigator.pop(context);
      },child: Text("okay"),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue[900]
        ),
      )
    ],
  );
  showDialog(context: context, builder: (BuildContext context){
    return alertbox;
  });
}