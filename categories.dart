import 'package:deneme/category.dart';
import 'package:deneme/header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class CategoriesPage extends StatelessWidget {

  final List<String>categoriler=[
    "Bilgisayarlar",
    "Klavye & Mouse",
    "Kulaklıklar",
    "Akıllı Saatler",
    "Telefon kılıf ve Aksesuarları",
    "Sepetim",

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
 header("Kategoriler",context),
    SizedBox(height: 16,),

Expanded(
  child: ListView(
      children:
  
  categoriler.map((String title) => buildCategory(title,context)).toList()),
),


    ],
      ),
        )
      ])
        )
    );
  }
}


Widget buildCategory(String title,context){ //Kategoriler isimlerinin listeden çekilmesi
  return GestureDetector(
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder:(context)
    {
      return CategoryPage(title);
    }));
    },
    child: Container(
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.only(bottom:16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  blurRadius: 4,
                  offset:Offset(0,4)),

            ]),
        child:Text(
         title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
        ),
        ),
      ),
  );

}