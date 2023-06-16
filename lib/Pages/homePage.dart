import 'package:flutter/material.dart';
import 'package:warranty_noty/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Hello world!", style: CustomTextStyle.heading1(context).copyWith(
            color: cPrimaryPurple
          ) ,),
        ),
      ),
    );
  }
}
