import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier{
  final List<Map<String, dynamic>> chezen = [];
  void addProduct(Map<String, dynamic> product){
    chezen.add(product);
    notifyListeners();
  }
  void removeProduct(Map<String, dynamic> product){
    chezen.remove(product);
    notifyListeners();
  }
}