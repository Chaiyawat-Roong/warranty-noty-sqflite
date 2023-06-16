import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/bloc/home_page_bloc.dart';

import '../constants.dart';

class FilterButton extends StatelessWidget {
  final String _label;
  final bool _isActive;
  final int _indexSelect;
  const FilterButton(
      {super.key,
      required bool isActive,
      required String label,
      required int id})
      : _isActive = isActive,
        _label = label,
        _indexSelect = id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<HomePageBloc>()
            .add(HomePageSelectEvent(index: _indexSelect));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: _isActive ? kPrimaryPurple : kBackgroundLightgrey,
            borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          _label,
          style: CustomTextStyle.body3(context)
              .copyWith(color: _isActive ? kPrimaryWhite : kPrimaryDarkPurple),
        ),
      ),
    );
  }
}
