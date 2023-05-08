import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_translations/crud/update_page.dart';

import '../components/my_textfield.dart';

class fetchstudent extends StatefulWidget {
  const fetchstudent({ Key? key }) : super(key: key);

  @override
  _fetchstudentState createState() => _fetchstudentState();
}

class _fetchstudentState extends State<fetchstudent> {
  final classtobeupdated = TextEditingController();
  final nametobeupdated = TextEditingController();
  final rollnofetched = TextEditingController();
  var db = FirebaseFirestore.instance;
  void getdata(String rollno) {
    final docRef = db.collection("students").doc(rollno);
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      classtobeupdated.text= data["Class"];
      nametobeupdated.text = data["name"];


      // ...
    },
    onError: (e) => print("Error getting document: $e"),
  );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Student"),
        backgroundColor: Colors.cyan[700],
      ),
      body: Center(
        child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
                controller: rollnofetched,
                hintText: 'Enter Rollno to be updated',
                obscureText: false,
              ),
            ElevatedButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const updatepage()),
            );
            }, child: Text("Fetch Student")),

          ],
        
            ),
        
      ),),
    );
  }
}