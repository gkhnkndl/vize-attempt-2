import 'package:flutter/material.dart';
import 'package:vizeapp/models/shoe.dart';

class Cart extends ChangeNotifier{
  // list of shoes fore sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "Zoom Freak",
      price: "236",
      imagePath: "assets/images/walker.png",
      descripton: "The signature shoe",
    ),
    Shoe(
      name: "New Balance",
      price: "70",
      imagePath: "assets/images/newbalance.png",
      descripton: "Found your way",
    ),
    Shoe(
      name: "Blue Jordan",
      price: "600",
      imagePath: "assets/images/jordanblue.png",
      descripton: "Add to your collection",
    ),
    Shoe(
      name: "Walker",
      price: "120",
      imagePath: "assets/images/jordan.png",
      descripton: "Walk as much as you want",
    ),
  ];
  // list of item in user cart
  List<Shoe> userCart = [];
  // get list of item for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }
  // get cart
  List<Shoe> getUserCart(){
    return userCart;
  }
  // add item to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  //remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
