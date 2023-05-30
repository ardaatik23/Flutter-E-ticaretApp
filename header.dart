import 'package:flutter/material.dart';
 Widget header(String title,context){

   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SizedBox(height: 29),
   //Geri Butonu

   GestureDetector(
     onTap: (){
       Navigator.pop(context);
     },


       child: Icon(Icons.arrow_back,color: Colors.brown,size: 25)),

   //KATEGORİLER
   SizedBox(height: 24),

   Text(
     title,
   style: TextStyle(
   fontWeight: FontWeight.bold,
   fontSize: 28,
   color: Colors.blueAccent),
   ),
     ],
   );


 }