import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/collors.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
   FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  int quantityCount = 0;

  void decrementQuantity(){
    setState(() {
      if (quantityCount > 0){
        quantityCount--;
      };
    });
  }

    void incrementQunatity(){
    setState(() {
      quantityCount++;
    });
  }

  void addToCart(){
    if (quantityCount > 0){
  final shop = context.read<Shop>();

  shop.addToCart(widget.food, quantityCount);

  showDialog(
    context: context,
    barrierDismissible: false,
  builder: (context)=> AlertDialog(
    backgroundColor: primaryColor,
    content: Text("Item added to cart",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
    actions: [
      IconButton(onPressed: (){
        Navigator.pop(context);
        Navigator.pop(context);
      }, icon: Icon(Icons.done,color: Colors.white,),)
    ],
  )
  );

  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
      
          //List view of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: ListView(children: [
              //image
              Image.asset(widget.food.imagePath,height: 200,),
                  
              SizedBox(height: 25,),
              //rating
              Row(
                children: [
                  
                  Icon(Icons.star,color: Colors.yellow[800],),
                  
                  SizedBox(width :10),
                  
                  Text(widget.food.rating,style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),),
                  
                ],
              ),
              SizedBox(height: 15,),
              //Food name

              Text(widget.food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 28),
              ),

              SizedBox(height: 25,),
                  
              //description
              Text("Description",
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              ),

              SizedBox(height: 10,),

              Text("A delicate slice of Sushi, fresh Sushi drapes over a pillow of perfectly seasoned Sushi rice. Introducing our exquisite Sushi Sensation: The Ocean's Symphony Roll! 🍣 Description 🍣 Dive into a world of culinary artistry with our Ocean's Symphony Roll, a true masterpiece of Japanese cuisine. Crafted with precision and passion, this sushi creation promises an unforgettable gastronomic experience that will transport your taste buds to the tranquil shores of Japan.",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                height: 2,
              ),
              )
                  
                      ],),
            )),

            Container(
              color: primaryColor,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  //price & quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text("\Rs."+widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      //quantity
                      Row(
                        children: [
                          //minus button
                          Container(
                            decoration: BoxDecoration(color:secondaryColor, shape: BoxShape.circle ),
                            child: IconButton(icon: Icon(Icons.remove,color: Colors.white,),
                            onPressed: decrementQuantity,),
                          ),

                          

                          //qunatity
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(quantityCount.toString(),style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                            ),
                          ),

                          //plus button
                          Container(
                            decoration: BoxDecoration(color:secondaryColor, shape: BoxShape.circle ),
                            child: IconButton(icon: Icon(Icons.add,color: Colors.white,),
                            onPressed: incrementQunatity,),
                          ),
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 25,),


                  //add to cart button
                  MyButton(text: "Add to Cart", onTap: addToCart)
                ],
              ),
            ),
      
        ],
      ),
    );
  }
}