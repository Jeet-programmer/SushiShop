import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/collors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context){

final shop = context.read<Shop>();
shop.removeFromCart(food);

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context,  value, child)=> Scaffold(
        backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("My Cart"),
        backgroundColor: primaryColor,
  
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context,index){
              //get food from cart
              final Food food =value.cart[index];
              //get food name
              final String foodName =food.name;
          
              //get food Price
              final String foodPrice =food.price;
          
              //return list tile
              return Container(
                decoration: BoxDecoration(color: secondaryColor,borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: ListTile(
                  title: Text(foodName,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  subtitle: Text(foodPrice, style: TextStyle(color: Colors.grey[100]),),
                  trailing: IconButton(onPressed: ()=>removeFromCart(food,context), icon: Icon(Icons.delete,color: Colors.white,)),
                ),
              );
              
            }),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MyButton(text: "Paynow", onTap: (){}),
          )
        ],
      ),
    ));
  }
}