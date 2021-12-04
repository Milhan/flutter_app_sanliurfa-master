import 'package:flutter/material.dart';

class MyView extends StatefulWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "my view",
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
