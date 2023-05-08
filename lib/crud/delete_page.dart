import 'package:flutter/material.dart';
import 'package:map_translations/services/crudfunctions.dart';

import '../components/my_textfield.dart';

class deletepage extends StatefulWidget {
  const deletepage({ Key? key }) : super(key: key);

  @override
  _deletepageState createState() => _deletepageState();
}

class _deletepageState extends State<deletepage> {
  final deleterollnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Student"),
        backgroundColor: Colors.cyan[700],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                controller: deleterollnocontroller,
                hintText: 'Enter Rollno',
                obscureText: false,
              ),
              SizedBox(height:20),
              ElevatedButton(onPressed: (){
                deleteStudent(deleterollnocontroller.text);
                Navigator.pop(context);
              }, child: Text("Delete Student"))
              ],),),),),
    );
  }
}