import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:map_translations/services/crudfunctions.dart";

import "../components/my_textfield.dart";

class updatepage extends StatefulWidget {
  const updatepage({ Key? key}) : super(key: key);

  @override
  _updatepageState createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
  final rollnocontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final classcontroller = TextEditingController();
  // final rollnotobeupdated = TextEditingController();
  // final classtobeupdated = TextEditingController();
  // final nametobeupdated = TextEditingController();

  // final docRef = db.collection("students").doc(rollnotobeupdated);
  // docRef.get().then(
  //   (DocumentSnapshot doc) {
  //     final data = doc.data() as Map<String, dynamic>;
  //     // ...
  //   },
  //   onError: (e) => print("Error getting document: $e"),
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Student"),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            children: [
              

              MyTextField(
                controller: rollnocontroller,
                hintText: "rollno",
                obscureText: false,
              ),
              MyTextField(
                controller: namecontroller,
                hintText: "name to be updated",
                obscureText: false,
              ),
              MyTextField(
                controller: classcontroller,
                hintText: "class to be updated",
                obscureText: false,
              ),
              SizedBox(height:20),
              ElevatedButton(onPressed: (){
                updateStudent(rollnocontroller.text,namecontroller.text,classcontroller.text);
              }, child: Text("Update")),
            ],
            
            ),),),),


    );
  }
}