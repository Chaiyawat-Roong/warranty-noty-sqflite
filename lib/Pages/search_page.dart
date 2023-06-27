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
    context.read<AppBloc>().add(SearchProductsEvent(name: ""));
    _SearchController.addListener(_onTextChanged);
  }


  void _onTextChanged() {
    setState(() {
      context.read<AppBloc>().add(SearchProductsEvent(name: _SearchController.text));
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
      body: BlocBuilder<AppBloc, AppState>(
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
                          itemCount: state.products!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(id: state.products![index].id!))).then((value) {
                                  setState(() {
                                  });
                                });
                                context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                              }
                              ,child: ItemCard(product: state.products![index]));
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
