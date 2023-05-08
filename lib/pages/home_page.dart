import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_translations/crud/create_page.dart';
import 'package:map_translations/crud/delete_page.dart';
import 'package:map_translations/crud/fetch_student.dart';
import 'package:map_translations/crud/mystudents.dart';
import 'package:map_translations/crud/update_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final user = FirebaseAuth.instance.currentUser!;
  
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(actions: [
        IconButton(onPressed:signUserOut,icon: Icon(Icons.logout)),
      
        
      ],
      title: Text("CRUD Operations"),

        backgroundColor: Colors.cyan[700],
      ),

      
      body: Center( child: Container(
        
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            ElevatedButton(onPressed: (){
              
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const createpage()),
            );
            }, child:Text("Create")),
            SizedBox(height:20),
            ElevatedButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mystudents()),
            );
            }, child:Text("Retrieve")),
            SizedBox(height:20),
            ElevatedButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const fetchstudent()),
            );
            }, child:Text("Update")),
            SizedBox(height:30),
            ElevatedButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const deletepage()),
            );
            }, child:Text("Delete")),
          ],
        ),
         ),),
      // + user.email!)),
    );
  }
}
