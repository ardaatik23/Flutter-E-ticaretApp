import 'package:deneme/categories.dart';
import 'package:flutter/material.dart';


class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea( // Telefonun üstündeki saat veya sarj toolbarı belirttik.
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0), //Sağdan soldan simetrik bir şekilde 16px boşluk bırakıyor.
          child: ListView(

            children: [
              //BAŞLIK
              buildBaslik(),
              //BANNER
              buildBanner(),
              //BUTONLAR
              Padding(
                padding:EdgeInsets.only(top:35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildNavigation(text: "Kategori", icon: Icons.menu,widget: CategoriesPage(),context: context),
                    buildNavigation(text: "Favoriler", icon: Icons.star_border),
                    buildNavigation(text: "Hediyeler", icon: Icons.card_giftcard),
                    buildNavigation(text: "Hesabım", icon: Icons.people),
                  ],
                ),
              ),

              SizedBox(height: 40,),
              // SALES

              Text("ÜRÜNLERİMİZ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color:Color(0XFF0A1034)),
              ),
              SizedBox(height: 15,),

              //SALES ITEM
              Row(
                children: [
                  buildSalesItem(text: "Telefonlar", photoUrl:"assets/images/phone.jpg", discount: "-%20",screenWidth: screenWidth),
                  buildSalesItem(text: "Monitörler", photoUrl:"assets/images/monitor.jpg", discount: "-%30",screenWidth: screenWidth),

                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}


Widget buildBaslik(){

  return Padding(
    padding: const EdgeInsets.only(top:24.0), //
    child: Text(
      " Fırat TeknoMarket ",
      style: TextStyle(
        fontSize:32,
        color:Colors.deepOrange,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner(){
  return Padding(
    padding: EdgeInsets.only(top:24),
    child:Container(
      width:double.infinity,
      padding:EdgeInsets.only(
          left:24, right:36,top:14, bottom:18),
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(6)),
      child:Row(
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(
                "Fırsat Ürünü: Mouse        ",
                style: TextStyle(
                    color:Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height :6),
              Text(
                "200TL yerine 100TL :) ",
                style:TextStyle(
                    color:Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),

              ),
            ],
          ),
          Image.asset("assets/images/mouse.jpg",width: 100, height: 100,),
        ],
      ),
    ),
  );
}


Widget buildNavigation({
  required String text,
  required IconData icon,

  Widget? widget,
  BuildContext? context,

} ){
  return GestureDetector(
    onTap:() {
      Navigator.push(context!, MaterialPageRoute (builder: (context)
      {
        return CategoriesPage();
      }));
    },
    child: Column(
      children: [
        Container(

          padding: EdgeInsets.symmetric(horizontal:19, vertical:22),
          decoration:BoxDecoration(
              shape:BoxShape.circle,
              color:Color(0XFFE0ECF8)),
          child: Icon(
            icon,
            color:Colors.purple,
            size:25,
          ),
        ),
        SizedBox(height:8),
        Text(
          text,
          style: TextStyle(
            color:Colors.purple,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}

Widget buildSalesItem({required String text, required String photoUrl, required String discount, required double screenWidth,}) {
  return Container(
    width: (screenWidth - 60)*0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//20%
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Color(0XFFE0ECF8)),
          child: Text(
            discount,
            style:
            TextStyle(color: Color(0XFF1F53E4), fontSize: 15),
        ),
 ),
        SizedBox(height: 22),
//TELEFON RESMİ

        Image.asset(photoUrl, width: 100, height: 100),

        SizedBox(height: 15),
//Telefon İSMİ

        Text(text,
            style:
             TextStyle(fontSize: 18, color: Color(0XFF1F53E4))),
],
),
);
}