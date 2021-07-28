import 'package:flutter/material.dart';
import 'Dashboard/dashboard.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tracker(),
  )));
}

class tracker extends StatefulWidget {
  final firstname;
  final lastname;
  final email;
  const tracker({Key? key,@required this.firstname,this.lastname, this.email}) : super(key: key);

  @override
  _trackerState createState() => _trackerState(firstname,lastname,email);
}

class _trackerState extends State<tracker> {
  List<String> Months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  int _counter=0;
  int _currentindex=0;
  String? firstname;
  String? lastname;
  String? email;
  bool flag=false;
  _trackerState(this.lastname,this.firstname,this.email);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('reach',style: TextStyle(fontSize: 45,fontFamily: 'teko'),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){},icon: Icon(
                Icons.qr_code
            ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,//label
            indicatorWeight: 3,
            //unselectedLabelStyle: TextStyle(color: Colors.white),
            unselectedLabelColor: Colors.white,
            labelColor: Colors.black,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              /*image: BoxDecoration(
                   image: AssetImage('images/mypic.jpg'),
                   fit:BoxFit.fitWidth
                 ),*/
              color: Colors.white,
            ),
            tabs: [
              Tab(child: Text("Tracker",style: TextStyle(fontSize: 20),)),
              Tab(child: Text("Community",style: TextStyle(fontSize: 20),)),
              Tab(child: Text("Explore",style: TextStyle(fontSize: 20),)),


            ],
          ),

        ),
       drawer: dashboard(firstname: firstname,lastname: lastname,email:email),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
              SizedBox(height: 20,),
              Center(child: Image.asset("images/piechart.jpg")),
              SizedBox(height: 20,),
              Text("Transaction History",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

              SizedBox(height: 15,)
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                height: 50,
                child: FloatingActionButton(
                  onPressed: (){

                    print(firstname);
                    print(lastname);

                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    //side: BorderSide(color: Colors.blue,width: 2)
                  ),
                  backgroundColor: Colors.blue[900],
                  child: Text("New Payment",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                ),
              ),
            ),

          ],
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