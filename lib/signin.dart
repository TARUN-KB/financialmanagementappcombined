import 'package:fincancialmanagement_combined/tracker.dart';
import 'package:flutter/material.dart';
import 'package:fincancialmanagement_combined/InputDeco_design.dart';
import 'package:fincancialmanagement_combined/signup.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: signin(),
  )));
}

class signin extends StatefulWidget {
  final email;
  final password;
  final firstname;
  final lastname;

  const signin({key,@required this.email, this.password,this.firstname, this.lastname}):super(key: key);
  @override
  _signinState createState() => _signinState(email,password,firstname,lastname);
}

class _signinState extends State<signin> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? firstname;
  String? lastname;
  bool flag=false;
  _signinState(this.email,this.password,this.lastname,this.firstname);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('reach',style: TextStyle(fontSize: 45,fontFamily: 'teko'),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text("r.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 120,color: Colors.blue[900]),),
                   SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration("Email"),
                      validator: (String? value){

                        if(value!.isEmpty)
                        {
                          return 'Please enter the email id';
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return 'Please enter a valid email id';
                        }
                        if(value!=email)
                          {
                            return 'This email id does not exist';
                          }
                        else
                          {
                            flag=true;
                          }

                        return null;
                      },
                      onChanged: (value){
                        email=value;
                      },

                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(

                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration:buildInputDecoration("Password"),

                      validator: (String? value){
                        if(value!.isEmpty)
                        {
                          return 'Please Enter the password';
                        }
                        if(value==password && flag)
                          {
                            return null;
                          }
                        else{
                          return 'Password is incorrect';
                        }


                      },


                    ),
                  ),
                  Text("Forgot Password ?"),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>tracker(firstname:firstname,lastname:lastname,email:email)));
                       /* if(_formkey.currentState!.validate())
                        {
                          print("successful");


                          return;
                        }else{

                          print("UnSuccessfull");
                        }*/
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.blue,width: 2)
                      ),
                      textColor:Colors.white,child: Text("Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),

                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No Account?"),
                        TextButton(onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));

                        }, child:  Text("Sign Up",style: TextStyle(color: Colors.blue),))

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
