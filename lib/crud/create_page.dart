// import 'dart:html';

import 'package:flutter/material.dart';

import '../components/my_textfield.dart';
import '../services/crudfunctions.dart';

class createpage extends StatefulWidget {
  const createpage({ Key? key }) : super(key: key);

  @override
  _createpageState createState() => _createpageState();
}

class _createpageState extends State<createpage> {
  final rollnocontroller = TextEditingController();
  final classcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Student"),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                controller: rollnocontroller,
                hintText: 'Enter Rollno',
                obscureText: false,
              ),
              MyTextField(
                controller: namecontroller,
                hintText: 'Enter Name',
                obscureText: false,
              ),
              MyTextField(
                controller: classcontroller,
                hintText: 'Enter Class',
                obscureText: false,
              ),
              SizedBox(height:20),
              ElevatedButton(onPressed: (){
                createStudent(rollnocontroller.text,namecontroller.text,classcontroller.text);
              }, child: Text("Create")),
            ],
            
            ),),),),


    );
  }
}