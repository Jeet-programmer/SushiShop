import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  void Function()? onTap;
   FoodTile({super.key,required this.food,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(08),
        child: Column(
          children: [
            Image.asset(
              food.imagePath,
              height: 140,
            ),
      
            Text(food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 15),),
            SizedBox(height: 10,),
      
            SizedBox(width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\Rs. '+food.price,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
      
                Row(
                  
                  children: [
                  Icon(Icons.star, color: Colors.yellow[800],),
                Text(food.rating,style: TextStyle(color: Colors.grey),)
                ],),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}