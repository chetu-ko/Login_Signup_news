import 'package:flutter/material.dart';

class Resposnive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Resposnive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static bool ismobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool istablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 850 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isdesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width > 850 && _size.width < 1100) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
