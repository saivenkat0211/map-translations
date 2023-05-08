import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
class mystudents extends StatefulWidget {
  const mystudents({ Key? key }) : super(key: key);

  @override
  _mystudentsState createState() => _mystudentsState();
}

class _mystudentsState extends State<mystudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        backgroundColor: Colors.cyan[700], 
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context,studentSnapshot){
            if(studentSnapshot.connectionState== ConnectionState.waiting){
              return Center(
                child:CircularProgressIndicator(),
              );
            }
            else{
              final studentdocs = studentSnapshot.data!.docs;
              return ListView.builder(
                itemCount: studentdocs.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      title: Text(studentdocs[index]['Name']),
                      subtitle: Text(studentdocs[index]['Rollno']+' ' + studentdocs[index]['Class']),
                      
                    ),
                  );
                },
              );
            }
          },

        ),
      ),
    );
  }
}