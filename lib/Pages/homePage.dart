import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Components/filterButton.dart';
import '../Components/itemCard.dart';
import '../bloc/home_page_bloc.dart';
import '../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageBloc = BlocProvider(create: (context) => HomePageBloc());
  final int _selectIndex = 0;
  List<String> objectDemo = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [homePageBloc],
        child: Scaffold(
          appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
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
          body: objectDemo.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 180),
                  alignment: Alignment.center,
                  height: 216,
                  child: const Image(
                      image: AssetImage('assets/images/rafiki.png')),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          child: BlocBuilder<HomePageBloc, HomePageState>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  FilterButton(
                                    isActive: state.selectIndex == 0,
                                    label: "ล่าสุด",
                                    id: 0,
                                  ),
                                  FilterButton(
                                    isActive: state.selectIndex == 1,
                                    label: "ใกล้หมดอายุ",
                                    id: 1,
                                  ),
                                ],
                              );
                            },
                          )),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return const ItemCard();
                            }),
                      )
                    ],
                  ),
                ),
          floatingActionButton: SizedBox(
            height: 48,
            child: FloatingActionButton.extended(
              backgroundColor: kPrimaryPurple,
              onPressed: () {
                Modular.to.pushNamed('/add');
              },
              label: Text(
                "จดวันรับประกัน",
                style: CustomTextStyle.heading3(context)
                    .copyWith(color: kPrimaryWhite),
              ),
              icon: const Icon(
                Icons.add,
                color: kPrimaryWhite,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ));
  }
}
