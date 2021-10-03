import 'package:flutter/material.dart';
import 'package:login_signup_news/bloc/cart_bloc.dart';
import 'package:login_signup_news/widget/news_card.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItem,
        builder: (context, snapshot) {
          print(snapshot.data.toString().length);
          return snapshot.data.toString().length > 15
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, i) {
                    return NewCardWidget(
                      isfev: true,
                      data: snapshot.data[i],
                    );
                  })
              : Center(
                  child: Text("You haven't taken any item yet"),
                );
        },
      ),
    );
  }
}
