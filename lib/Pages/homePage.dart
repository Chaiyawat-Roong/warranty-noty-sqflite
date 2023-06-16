import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/home_page_bloc.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageBloc = BlocProvider(create: (context) => HomePageBloc());
  List<String> objectDemo = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [homePageBloc],
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 64,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("Warranty Noty",
                    style: CustomTextStyle.heading1(context)
                        .copyWith(color: kPrimaryDarkPurple)),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: kPrimaryDarkPurple,
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/search');
                    },
                  ),
                )
              ]),
          body: objectDemo.isEmpty ? Center(
            child:  Text(
              "Hello world!",
              style: CustomTextStyle.heading1(context)
                  .copyWith(color: kPrimaryPurple),
            ),
          ) : Text("test"),
          floatingActionButton: Container(
            height: 48,
            child: FloatingActionButton.extended(
              backgroundColor: kPrimaryPurple,
              onPressed: () {},
              label: Text("จดวันรับประกัน", style: CustomTextStyle.heading3(context).copyWith(
                color: kPrimaryWhite
              ),),
              icon: Icon(Icons.add, color: kPrimaryWhite,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ));
  }
}
