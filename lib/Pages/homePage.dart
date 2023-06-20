import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/Pages/addProductPage.dart';
import 'package:warranty_noty/Pages/searchPage.dart';
import 'package:warranty_noty/bloc/app_repository.dart';

import '../Components/filterButton.dart';
import '../Components/itemCard.dart';
import '../bloc/app_bloc.dart';
import '../bloc/product_data_provider.dart';
import '../constants.dart';
import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
                },
              ),
            )
          ]),
      body: BlocBuilder<AppBloc, HomePageState>(builder: (context, state) {
        if(state is HomePageInitial){
          return state.products!.isEmpty ? Container(
              margin: const EdgeInsets.only(top: 180),
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
                      margin: const EdgeInsets.only(bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
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
                          )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ListView.builder(
                          itemCount: state.products!.length,
                          itemBuilder: (context, index) {
                            return ItemCard(product: state.products![index]);
                          }),
                    ),
                  )
                ],
              ),
            );
        }else if(state is HomePageFinishState){
          return state.products!.isEmpty ? Container(
              margin: const EdgeInsets.only(top: 180),
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
                      margin: const EdgeInsets.only(bottom: 16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
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
                          )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ListView.builder(
                          itemCount: state.products!.length,
                          itemBuilder: (context, index) {
                            return ItemCard(product: state.products![index]);
                          }),
                    ),
                  )]));
        }else{
          return Container();
        }
      },),
      floatingActionButton: SizedBox(
        height: 48,
        child: FloatingActionButton.extended(
          backgroundColor: kPrimaryPurple,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProductPage()));
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
    );
  }
}
