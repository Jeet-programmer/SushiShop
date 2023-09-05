import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/Food_tile.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/food_details.dart';
import 'package:sushishop/themes/collors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
//Food menu




void navigateToFoodDetails(int index) {
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;

  Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodDetails(
    food: foodMenu[index],
  )));
}

  @override
  Widget build(BuildContext context) {
      final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text("Tokyo",style: TextStyle(color: Colors.grey[900]),),
        actions: [
          IconButton(onPressed: (){
Navigator.pushNamed(context, '/cartPage');
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          //promo banner
          Container(
          
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 40),
            decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Get 30% off", style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
        
                    const SizedBox(height: 20,),
        
                    MyButton(text: "Redeem", onTap: (){}),
        
        
                  ],
                ),
                Image.asset('lib/images/sushi.png',height: 100,),
              ],
        
              
            ),
          ),
        
          SizedBox(height: 25,),
        
          // searchbar
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Search Here...",
              ),
            ),
          ),
        
          SizedBox(height: 25,),
        
        
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:24.0),
            child: Text("Food Menu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
              fontSize: 18,
            ),),
          ),
        
          SizedBox(height: 25,),
        
          Expanded(
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context,index)=>FoodTile(
            food: foodMenu[index],
            onTap: ()=> navigateToFoodDetails(index),
                    ),)),
        
           SizedBox(height: 25,),
        
        
        
          //popular
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(25)
            ),
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 5),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/images/sushi (1).png', height: 40,),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Salmon Eggs,",
                    style: GoogleFonts.dmSerifDisplay(fontSize: 19),),
        
                    SizedBox(height: 25,),
        
                    Text("\Rs. 80",
                    style: TextStyle(color: Colors.grey[700]),)
                  ],
                ),
      
                Icon(Icons.favorite_outline,color: Colors.grey[800],),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}