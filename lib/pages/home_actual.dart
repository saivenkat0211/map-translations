import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_translations/pages/imagepicker.dart';
import 'package:map_translations/pages/predictedimage.dart';

import 'getprediction.dart';

class HomeActual extends StatefulWidget {
  const HomeActual({ Key? key }) : super(key: key);
  
  @override
  _HomeActualState createState() => _HomeActualState();
}

class _HomeActualState extends State<HomeActual> {
  
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  
  Widget build(BuildContext context) {
  //   Future<GetPrediction> askPrediction(Uint8List img,int c) async {
  //   // setState(() {
  //   //   loading = true;
  //   // });
  //   // int c = 0;
  //   String base64String = base64Encode(img);
  //   print(base64String);
  //   final response = await http.post(
  //     Uri.parse(
  //         'https://8617-183-82-46-36.ngrok-free.app/predict'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'type': c,
  //       'image': base64String,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     print("hello res");
  //     return GetPrediction.fromJson(jsonDecode(response.body));
  //   } else {
  //     print('Request failed with status: ${response.body}.');
  //     throw Exception('Failed to fetch');
  //   }
  // }
    Future<GetPrediction> askPrediction(Uint8List img, int c) async {
      // setState(() {
      //   loading = true;
      // });
      String base64String = base64Encode(img);
      
      print(base64String);
      final response = await http.post(
        Uri.parse(
            'https://8617-183-82-46-36.ngrok-free.app/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'type': c,
          'image': base64String,
        }),
      );

      if (response.statusCode == 200) {
         print("hello res");
        return GetPrediction.fromJson(jsonDecode(response.body));
      } else {
         print('Request failed with status: ${response.body}.');
        throw Exception('Failed to fetch');
      }}
    // Future<GetPrediction> askPrediction(Uint8List img, int c) async {
    //   String base64String = base64Encode(img);
    //   // print(base64String);
    //   final response = await http.post(
    //     Uri.parse(
    //        'https://8617-183-82-46-36.ngrok-free.app/predict'),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode(<String, dynamic>{
    //       'type': c,
    //       'image': base64String,
    //     }),
    //   );

    //   if (response.statusCode >= 200) {
    //     // print("hello res");
    //     return GetPrediction.fromJson(jsonDecode(response.body));
    //   } else {
    //     // print('Request failed with status: ${response.body}.');
    //     throw Exception('Failed to fetch');
    //   }
    // }
    
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(actions: [
        IconButton(onPressed:(){
          signUserOut();
        },icon: Icon(Icons.logout)),
      
        
      ],
      title: Text("Conversions"),

        backgroundColor: Colors.cyan[700],
      ),

      
      body: Center( child: Container(
        
        margin: EdgeInsets.all(20),
        child: Column(
         
          mainAxisAlignment:MainAxisAlignment.start,
          children:[
             SizedBox(height:280),
            Text("Welcome Saivenkat"),
            SizedBox(height:20),
            ElevatedButton(onPressed: ()async{
              Uint8List? img,img1;
              try{
                img = await iamgepicker(ImageSource.gallery);
                print(img);
                final GetPrediction s =
                  await askPrediction(
                  img as Uint8List, 1);
                  img1 = base64Decode(s.result);
                
                  print("result");
                  print(img1);
                  Navigator.push(
                      context,
                  MaterialPageRoute(builder: (context) => predictedimage(img:img1 as Uint8List,imgoriginal: img as Uint8List)));
                  //print(img1);

                
              }catch(error){
                print(error.toString());
                print("error");
              }
            



            
            }, child:Text("Map-to-Satellite")),
            SizedBox(height:40),
            ElevatedButton(onPressed: ()async{
              Uint8List? img,img1;
              try{
                img = await iamgepicker(ImageSource.gallery);
                print(img);
                final GetPrediction s =
                  await askPrediction(
                  img as Uint8List, 0);
                  img1 = base64Decode(s.result);
                  print("result");
                  print(img1);
                   Navigator.push(
                      context,
                  MaterialPageRoute(builder: (context) => predictedimage(img:img1 as Uint8List,imgoriginal: img as Uint8List,)));


              }catch(error){
                print("error");
              }
            



            
            }, child:Text("Satellite-to-Map")),
            
          ],
        ),
         ),),
      // + user.email!)),
    );
  }
}