import 'package:flutter/material.dart';
import 'goal.dart';
import 'profile.dart';
class dashboard extends StatelessWidget {
  final lastname,firstname,email;
  const dashboard({Key? key,@required this.lastname, this.firstname,this.email}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue[900],
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/mypic.jpg'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Text("$firstname $lastname",style: TextStyle(
                          fontSize: 25,
                          color: Colors.white

                      ),),
                      Text("$email",style:TextStyle(
                          fontSize: 15,
                          color: Colors.white

                      ),)
                    ],
                  ),
                ),
              ),
              Container(
                  color: Colors.grey,
                  child: SizedBox(height: 10,)),
              ListTile(
                leading: Icon(Icons.person,color: Colors.grey[800],),
                title: Text("Profile",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
            },

              ),
              //SizedBox(height: 3,),

              ListTile(
                leading: Icon(Icons.my_location,color: Colors.grey[800],),
                title: Text("Goal",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>goal()));
                },

              ),


              ListTile(
                leading: Icon(Icons.calendar_today_sharp,color: Colors.grey[800],),
                title: Text("Calendar",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),


              ListTile(
                leading: Icon(Icons.switch_account,color: Colors.grey[800],),
                title: Text("Accounts",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),


              ListTile(
                leading: Icon(Icons.report,color: Colors.grey[800],),
                title: Text("Reports",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),

              ListTile(

                leading: Icon(Icons.settings,color: Colors.grey[800],),
                title: Text("Settings",style: TextStyle(
                  fontSize: 20
                  ,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),

              ListTile(
                leading: Icon(Icons.help_sharp,color: Colors.grey[800],),
                title: Text("Help and Feedback",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),

              ListTile(
                leading: Icon(Icons.supervisor_account_sharp,color: Colors.grey[800],),
                title: Text("Invite",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),


              ListTile(
                leading: Icon(Icons.contact_phone,color: Colors.grey[800],),
                title: Text("Contact",style: TextStyle(
                  fontSize: 20,color: Colors.grey[800],
                ),),
                onTap: (){},

              ),



              ListTile(

                leading: Icon(Icons.logout,color: Colors.grey[800],),
                title: Text("LogOut",style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                ),),
                onTap: (){},

              ),

            ],


          ),
        ),
      ),
    );
  }
}
