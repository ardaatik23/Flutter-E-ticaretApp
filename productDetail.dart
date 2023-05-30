
import 'package:deneme/header.dart';
import 'package:deneme/label.dart';
import 'package:flutter/material.dart';
class ProductDetailPage extends StatefulWidget {

String productTitle;
ProductDetailPage(this.productTitle);
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Color selectedColor;


  List<Color>colors=[
    Color(0xFF8b4513),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
  ];
List<int> capacities=[64,256,512];
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
    header(widget.productTitle,context),
    SizedBox(height:30),

      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
              children: [
                label("New"),
                SizedBox(height: 15),
                Image.asset("assets/images/laptop1.jpg", width: 130, height: 130),
                SizedBox(height: 10),

                //Renk seçenekleri
          Text(
              "RENKLER",
              style: TextStyle(
                fontSize: 18,
               fontWeight: FontWeight.w500,
                color: Color(0xFF0A1034)),
          ),
                SizedBox(height: 16,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: colors.map((Color color) => colorOption(color))
                  .toList()),



              //KAPASİTE SEÇENEKLERİ

SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kapasite:   ",
style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueAccent),

                    ),

SizedBox(height: 12,),
                Text("64GB",style: TextStyle(color: Color(0xFF0001FC), fontSize: 16),
                ),
],
      ),


                SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:Color(0XFF0001FC),
                    ),
                    child:Text("Sepete Şimdi Ekle :) ", textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,color:Colors.white),
                    ),
                ),





            ],
          ),
      ),
    ]))
    ])));
  }
}

//colorOption
Widget colorOption(Color color){
  return Container(
    margin:EdgeInsets.only(right:15),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
    width:23,
    height: 23,

  );
}

Widget capacityOption(int capacity){
return Text("$capacity gb", style: TextStyle(color: Color(0xFF0001FC), fontSize: 16),
);

}