import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,color: kPrimaryDarkPurple,), onPressed: (){
          Modular.to.pop();
        },),
        toolbarHeight: 64,
        centerTitle: true,
        title: Text("ข้อมูลสินค้า", style: CustomTextStyle.heading1(context).copyWith(
          color: kPrimaryDarkPurple
        ),),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          "Hello world!",
          style: CustomTextStyle.heading1(context)
              .copyWith(color: kPrimaryPurple),
        ),
      ),
    );
  }
}