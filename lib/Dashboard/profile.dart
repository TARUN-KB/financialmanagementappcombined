import 'package:flutter/material.dart';
import 'package:fincancialmanagement_combined/InputDeco_design.dart';
import 'dashboard.dart';

void main() {
  runApp((MaterialApp(
    debugShowCheckedModeBanner: false,
    home: (profile()),
  )));
}

class profile extends StatefulWidget {

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  late String? firstname,lastname,phone;
  late String? incomeamount;
  String incometype="Consistent";
  String gender="MALE";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime?  pickdate;
  final List<String> genderlist=<String>
  ["MALE","FEMALE"];
  final List<String> incomelist=<String>
  ["Consistent","Inconsistent"];

  @override
  void initState(){
    super.initState();
    pickdate=DateTime.now();

  }

  _pickdate(BuildContext context) async
  {
    DateTime? date=await showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate:DateTime(DateTime.now().year-100),
      lastDate: DateTime(DateTime.now().year+100),

    );
    if(date!=null)
    {
      setState(() {
        pickdate=date;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('reach',style: TextStyle(fontSize: 45,fontFamily: 'teko'),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(

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
                  SizedBox(width: 30,),
                    Text("Your Profile",style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                    ),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration("First Name"),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Fill this Field';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      firstname = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration("Last Name"),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Fill this Field';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      lastname = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration("Phone No"),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please enter phone no ';
                      }
                      if(value.length !=10)
                      {return "Enter Valid phone number";}

                      return null;
                    },
                    onSaved: (String? value){
                      phone = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration("Income Amount"),
                    validator: (String? value){
                      if(value!.isEmpty)
                      {
                        return 'Please Fill this Field';
                      }
                      return null;
                    },
                    onSaved: (String? value){
                      incomeamount = value;
                    },
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(

                          padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          child: Text("DOB:",
                            style: TextStyle(
                              fontSize: 17,
                            ),),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
                        //padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                        //margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue,width:2.5 ),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey,
                        ),
                        child: ListTile(
                          title: Text("${pickdate!.day}-${pickdate!.month}-${pickdate!.year}"),
                          trailing:Icon(Icons.arrow_drop_down),
                          onTap: (){
                            _pickdate(context);

                          },

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(

                          padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          child: Text("Gender:",
                            style: TextStyle(
                              fontSize: 17,
                            ),),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
                        padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                        //margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue,width:2.5 ),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey,
                        ),
                        child: DropdownButton<String>(
                          hint:Text("Select Gender"),
                          value: gender,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (newValue) {
                            setState(() {
                             gender = newValue!;
                            });
                          },
                          /*validator: (String newvalue){
                            if(newvalue.isEmpty)
                            {
                              return 'Please enter phone no ';
                            }
                            return null;
                          },*/
                          items: genderlist
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,0.0),
                          child: Text("Income Type:",
                          style: TextStyle(
                            fontSize: 17,
                          ),),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(9, 4, 4, 4),
                        margin: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue,width:2.5 ),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.grey,
                        ),
                        child: DropdownButton<String>(

                          value: incometype,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          isExpanded: true,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (newValue) {
                            setState(() {
                              incometype = newValue!;
                            });
                          },
                          /*validator: (String newvalue){
                            if(newvalue.isEmpty)
                            {
                              return 'Please enter phone no ';
                            }
                            return null;
                          },*/
                          items: incomelist
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
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 6,),
          SizedBox(
            width: 100,
            height: 50,
            child: RaisedButton(
              color: Colors.blue[900],
              onPressed: (){

                  if(_formkey.currentState!.validate())
                  {

                print("successful");
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>signin(email:email,password:password)));

                    return;
                    }
                  else{
                   print("UnSuccessfull");
                  }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                 // side: BorderSide(color: Colors.blue,width: 2)
              ),
              textColor:Colors.white,child: Text("SAVE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),

            ),
          ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
