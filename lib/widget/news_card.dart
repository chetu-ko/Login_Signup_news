import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_signup_news/bloc/cart_bloc.dart';

import 'package:login_signup_news/model/news_model.dart';
import 'package:login_signup_news/responsive.dart';

class NewCardWidget extends StatelessWidget {
  final Data data;
  final bool isfev;
  const NewCardWidget({
    @required this.isfev,
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                  width: 50,
                  height: 80,
                  child: IconButton(
                      icon: isfev == false
                          ? Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            ),
                      onPressed: () {
                        isfev == false
                            ? bloc.addToCart(data)
                            : bloc.removeFromCart(data);
                      })),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: Resposnive.isdesktop(context) ? width * 0.8 : null,
                      child: Text(
                        data.title == null
                            ? ""
                            : data.title.length > 40
                                ? data.title.substring(0, 40) + '...'
                                : data.title,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: Resposnive.isdesktop(context)
                          ? width * 0.8
                          : width * 0.5,
                      child: Text(
                        data.summary ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Text(data.published,
                        style: TextStyle(fontSize: 12, color: Colors.black38))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
