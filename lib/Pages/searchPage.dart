import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/searchTextField.dart';
import '../bloc/home_page_bloc.dart';
import '../constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final homePageBloc = BlocProvider(create: (context) => HomePageBloc());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [homePageBloc],
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 64,
            title: const SearchTextField(),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Container(
              child: Text(
                "Hello world!",
                style: CustomTextStyle.heading1(context)
                    .copyWith(color: kPrimaryPurple),
              ),
            ),
          ),
        ));
  }
}
