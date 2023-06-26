import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/Pages/add_product_page.dart';
import 'package:warranty_noty/Pages/search_page.dart';

import '../Components/filter_button.dart';
import '../Components/item_card.dart';
import '../bloc/app_bloc.dart';
import '../constants.dart';
import 'details_page.dart';

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
              ),
            )
          ]),
      body: BlocBuilder<AppBloc, HomePageState>(
        builder: (context, state) {
          if (state is HomePageInitial) {
            return state.products!.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                          height: MediaQuery.of(context).size.height * 0.25,
                          image: const AssetImage('assets/images/rafiki.png')),
                      const SizedBox(height: 24),
                      Center(
                          child: Text("รายการว่างเปล่า",
                              style: CustomTextStyle.body1(context)
                                  .copyWith(color: kPrimaryDarkPurple))),
                      const SizedBox(height: 8),
                      Center(
                          child: Text("กดปุ่มเพื่อเริ่มจดวันรับประกันสินค้า",
                              style: CustomTextStyle.body2(context)
                                  .copyWith(color: kPrimaryDarkPurple))),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
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
                                const SizedBox(width: 8,),
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
                                  return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: state.products![index]))).then((value) {
                                      context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                                    });
                                  },
                                  child: ItemCard(
                                      product: state.products![index]),
                                );
                                }),
                          ),
                        )
                      ],
                    ),
                  );
          } else if (state is HomePageFinishState) {
            return state.products!.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                          height: MediaQuery.of(context).size.height * 0.25,
                          image: const AssetImage('assets/images/rafiki.png')),
                      const SizedBox(height: 24),
                      Center(
                          child: Text("รายการว่างเปล่า",
                              style: CustomTextStyle.body1(context)
                                  .copyWith(color: kPrimaryDarkPurple))),
                      const SizedBox(height: 8),
                      Center(
                          child: Text("กดปุ่มเพื่อเริ่มจดวันรับประกันสินค้า",
                              style: CustomTextStyle.body2(context)
                                  .copyWith(color: kPrimaryDarkPurple))),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Column(children: [
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
                              const SizedBox(width: 8,),
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
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: state.products![index]))).then((value) {
                                      context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                                    });
                                  },
                                  child: ItemCard(
                                      product: state.products![index]),
                                );
                              }),
                        ),
                      )
                    ]));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: SizedBox(
        height: 48,
        child: FloatingActionButton.extended(
          backgroundColor: kPrimaryPurple,
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProductPage()))
                .then((value) {
              context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
            });
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
