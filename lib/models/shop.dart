import 'package:flutter/material.dart';
import 'package:sushishop/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu =[
  Food(name: "Salmon Sushi", price: "90.00", imagePath: "lib/images/sushi (2).png", rating: "4.9"),
  Food(name: "Tuna Sushi", price: "80.00", imagePath: "lib/images/sushi (3).png", rating: "4.5"),
];

//customer Cart
List <Food> _cart =[

];

//getter method
List <Food> get foodMenu => _foodMenu;
List <Food> get cart => _cart;

//add to cart
void addToCart(Food foodItem, int quantity){
  for (int i = 0; i < quantity; i++){
    _cart.add(foodItem);
  }
  notifyListeners();
}

//remove from cart

void removeFromCart(Food food){
  _cart.remove(food);
  notifyListeners();
}

}