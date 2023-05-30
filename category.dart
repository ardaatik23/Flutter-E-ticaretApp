import 'package:deneme/header.dart';
import 'package:deneme/productDetail.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  String CategoryTitle;

  CategoryPage(this.CategoryTitle);

List<Map>products=[
  {"isim" : "Asus ZenBook","fotograf" : "assets/images/laptop2.jpg","fiyat" :"5000TL"},
  {"isim" : "Asus UltraBook","fotograf" : "assets/images/laptop2.jpg","fiyat" :"6000TL"},
  {"isim" : "Asus NoteBook","fotograf" : "assets/images/laptop2.jpg","fiyat" :"7000TL"},
  {"isim" : "Apple MacBook","fotograf" : "assets/images/laptop2.jpg","fiyat" :"USD ${400}"},
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea( // Telefonun üstündeki saat veya sarj toolbarı belirttik.
    child:Stack(children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal:16.0), //Sağdan soldan simetrik bir şekilde 16px boşluk bırakıyor.

    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    header(CategoryTitle,context),
SizedBox(height:30),

          Expanded(
            child: GridView.count(

              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              children:products.map((Map product){
              return buildContent(
                  product["isim"], product["fotograf"], product["fiyat"],context);
            }).toList(),
            ),
          )
        ]),
    ),
    ])));
  }
}

Widget buildContent(String title,String photoUrl , String price,context){
  return  GestureDetector(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ProductDetailPage (title) ;
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12 ),

      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: Offset(0,16))
        ],

      ),
      child:Column(
        children: [
          SizedBox(height: 5,),
          Image.asset(photoUrl,width: 90, height: 90,),
SizedBox(height:5,),
          Column(children: [
            SizedBox(height: 6),
            Text(title,style: TextStyle(color: Colors.deepOrange,fontSize: 12),),
            SizedBox(height: 6,),
            Text(price,style: TextStyle(color: Colors.deepOrange,fontSize: 15),),
          ],)
        ],),


    ),
  );
}