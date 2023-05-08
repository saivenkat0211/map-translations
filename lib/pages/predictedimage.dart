import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class predictedimage extends StatefulWidget {
  Uint8List img;
  Uint8List imgoriginal;

  predictedimage({super.key,required this.img,required this.imgoriginal});

  @override
  State<predictedimage> createState() => _predictedimageState(img,imgoriginal);
}

class _predictedimageState extends State<predictedimage> {
  Uint8List img,imgoriginal;
  _predictedimageState(this.img,this.imgoriginal);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(child: Center(child :Column(

        children: [
           SizedBox(height:20),
          Center(child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 10,
              child: Image.memory((imgoriginal),fit: BoxFit.fill,),
            ),),
        SizedBox(height:20),
        Text(
                'Original Image!',
                style:TextStyle(
                  color: Colors.grey[700],
                  fontSize: 24,
                ),
              ),
          SizedBox(height: 30,),
          
          Center(child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 10,
              child: Image.memory((img),fit: BoxFit.fill,),
            ),),
        SizedBox(height:20),
        Text(
                'Predicted Image!',
                style:TextStyle(
                  color: Colors.grey[700],
                  fontSize: 24,
                ),
              ),],
        
      ),)),)

    ));
    
  }
}