import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/item_card.dart';
import '../Components/search_text_field.dart';
import '../bloc/app_bloc.dart';
import '../models/product.dart';
import 'details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _SearchController = TextEditingController();
  List<Product> products = [];
  List<Product> filterProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    products = context.read<AppBloc>().state.products!;

    _SearchController.addListener(_onTextChanged);
  }


  void _onTextChanged() {
    setState(() {
      filterProducts = products.where((element) => element.name!.toLowerCase().contains(_SearchController.text.toLowerCase())).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: SearchTextField(controller: _SearchController),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<AppBloc, HomePageState>(
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: ListView.builder(
                          itemCount: filterProducts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(product: state.products![index]))).then((value) {
                                  setState(() {
                                  });
                                });
                                context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                              }
                              ,child: ItemCard(product: filterProducts[index]));
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
