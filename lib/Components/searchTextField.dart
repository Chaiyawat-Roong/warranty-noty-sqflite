import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:warranty_noty/bloc/home_page_bloc.dart';
import 'package:warranty_noty/constants.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  FocusNode myfocus = FocusNode();

  @override
  void initState() {
    myfocus.addListener(() {
      if (myfocus.hasFocus) {
        print("Textfield one got focused.");
      } else {
        Modular.to.pop();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: kBackgroundLightgrey,
              borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            focusNode: myfocus,
            autofocus: true,
            style: const TextStyle(color: Color(0xFF3F3E6D)),
            decoration: InputDecoration(
                hintText: "ค้นหา",
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kSecondaryGrey,
                    ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: kPrimaryDarkPurple,
                  ),
                  onPressed: () {

                  },
                ),
                suffixIconColor: const Color(0xFF3F3E6D),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: kPrimaryDarkPurple),
                  onPressed: () {
                    Modular.to.pop();
                  },
                )),
          ),
        ),
      ],
    );
  }
}
