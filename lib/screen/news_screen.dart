import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_news/cubit/cubit/toggle_button_cubit.dart';
import 'package:login_signup_news/model/news_model.dart';
import 'package:login_signup_news/repository/news_api_repo.dart';
import 'package:login_signup_news/screen/fevorite_screen.dart';
import 'package:login_signup_news/widget/news_card.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleButtonCubit, NewsButtonState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent.withOpacity(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(20))),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)), // <-- Radius
                      ),
                      color: state.props[0] ? Colors.blue : Colors.white,
                      onPressed: () =>
                          context.read<ToggleButtonCubit>().toggleFev(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notes,
                            color: state.props[0] ? Colors.white : Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "News",
                            style: TextStyle(
                                fontSize: 25,
                                color: state.props[0]
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)), // <-- Radius
                      ),
                      color: state.props[1] ? Colors.blue : Colors.white,
                      onPressed: () =>
                          context.read<ToggleButtonCubit>().toggleNews(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_outlined,
                            color: state.props[1] ? Colors.red : Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Fev",
                            style: TextStyle(
                                fontSize: 25,
                                color: state.props[1]
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            body: state.props[0].toString() == 'true'
                ? FutureBuilder<List<Data>>(
                    future: NewsApi().apiNEWs(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return NewCardWidget(
                                    isfev: false, data: snapshot.data[index]);
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  )
                : state.props[1].toString() == 'true'
                    ? Checkout()
                    : Container());
      },
    );
  }
}
