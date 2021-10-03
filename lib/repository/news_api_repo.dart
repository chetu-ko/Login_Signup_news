import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_news/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup_news/screen/news_screen.dart';

class NewsApi {
  Future<List<Data>> apiNEWs() async {
    final uri = Uri.parse('https://api.first.org/data/v1/news');
    final response = await http.get(uri, headers: {});

    final Map<String, dynamic> data = json.decode(response.body);

    var rest = data['data'] as List;

    List<Data> list = rest.map((e) => Data.fromJson(e)).toList();

    return list;
  }

  Future<void> apiLogin(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://www.postman.com/collections/299632c9a18ed457ba78/'));
    request.body = json.encode({
      "email": "ajha1058@gmail.com",
      "password": "ajha1054",
      "passwordConf": "ajha1054"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewsPage()));
    } else {
      print(response.reasonPhrase);
    }
  }
}
