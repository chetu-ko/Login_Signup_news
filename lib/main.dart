import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_news/cubit/cubit/login_toggle_cubit.dart';

import 'package:login_signup_news/cubit/cubit/toggle_button_cubit.dart';
import 'package:login_signup_news/screen/loginScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NewsApp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ToggleButtonCubit>(
                create: (context) => ToggleButtonCubit()),
            BlocProvider<LoginToggleCubit>(
                create: (context) => LoginToggleCubit()),
          ],
          child: LoginScreen(),
        ));
  }
}
