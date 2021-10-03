import 'dart:async';

import 'package:login_signup_news/model/news_model.dart';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final List<Data> allItem = [];

  void addToCart(Data item) {
    allItem.add(item);
    cartStreamController.sink.add(allItem);
  }

  void removeFromCart(Data item) {
    allItem.remove(item);
    cartStreamController.sink.add(allItem);
  }

  void dispose() {
    cartStreamController.close();
  }
}

final bloc = CartItemsBloc();
