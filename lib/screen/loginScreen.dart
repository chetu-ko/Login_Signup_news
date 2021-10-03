import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_news/cubit/cubit/login_toggle_cubit.dart';
import 'package:login_signup_news/cubit/cubit/toggle_button_cubit.dart';
import 'package:login_signup_news/screen/news_screen.dart';
import 'package:login_signup_news/util/valildators.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "WelCome!!",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<LoginToggleCubit, LoginToggleState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  height: state.props[1] ? 560 : 470,
                  width: MediaQuery.of(context).size.width,
                  child: state.props[0].toString() == 'true'
                      ? FormWidget(
                          heading: "Sign in",
                          form1name: "Email",
                          form2name: "password",
                          // context: context,
                          form3name: "null",
                          submitbutton: "Sign In",
                          signLogbuttonname: "Sign Up")
                      : state.props[1].toString() == 'true'
                          ? SingleChildScrollView(
                              child: FormWidget(
                                  heading: "Sign Up",
                                  form1name: "Email",
                                  //context: context,
                                  form2name: "password",
                                  form3name: "Confirm pass",
                                  submitbutton: "Sign Up",
                                  signLogbuttonname: "Login"),
                            )
                          : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  final String heading;
  final String form1name;
  final String form2name;
  final String form3name;
  final String submitbutton;
  final String signLogbuttonname;
  FormWidget(
      {this.form1name,
      this.form2name,
      this.form3name,
      this.heading,
      this.signLogbuttonname,
      this.submitbutton});
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmpassword = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            heading,
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusColor: Colors.brown[400],
                filled: true,
                hintStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                hintText: form1name,
                fillColor: Colors.brown[200]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            obscureText: true,
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusColor: Colors.brown[400],
                filled: true,
                hintStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                hintText: form2name,
                fillColor: Colors.brown[200]),
          ),
        ),
        form3name == "null"
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  controller: confirmpassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusColor: Colors.brown[400],
                      filled: true,
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      hintText: form3name,
                      fillColor: Colors.brown[200]),
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: TextButton(
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(30)), // <-- Radius
              ),
              color: Colors.blue[300],
              onPressed: () {
                String message;
                message = Validators().emailvalidate(email.text.toString());
                message == "True"
                    ? message =
                        Validators().validatePass(password.text.toString())
                    : print("ok");
                submitbutton == "Sign Up"
                    ? message = Validators().validateConfirmPadd(
                        confirmpassword.text.toString(),
                        password.text.toString())
                    : print("ok");
                if (message == "True") {
                  submitbutton == "Sign In"
                      ? Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Success")))
                          .close()
                      : Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("Please Login")))
                          .close();
                  submitbutton == "Sign In"
                      ? Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(providers: [
                                BlocProvider<ToggleButtonCubit>(
                                    create: (context) => ToggleButtonCubit()),
                              ], child: NewsPage())))
                      : context.read<LoginToggleCubit>().toggleLogin();
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    duration: Duration(milliseconds: 500),
                  ));
                }
              },
              child: Text(
                submitbutton,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: 50,
                color: Colors.black,
              ),
              Text("Or aign in with"),
              Container(
                height: 1,
                width: 50,
                color: Colors.black,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/google.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/fb.png'), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                signLogbuttonname == "Sign Up"
                    ? context.read<LoginToggleCubit>().toggleSignIn()
                    : context.read<LoginToggleCubit>().toggleLogin();
              },
              child: Text(signLogbuttonname,
                  style: TextStyle(color: Colors.amber)),
            )
          ],
        )
      ],
    );
  }
}
