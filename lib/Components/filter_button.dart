import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/bloc/app_bloc.dart';

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
    return SizedBox(
      height: 29,
      child: ElevatedButton(
        onPressed: () {
          context.read<AppBloc>().add(HomePageSelectEvent(index: _indexSelect));
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _isActive ? kPrimaryPurple : kBackgroundLightgrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(
          _label,
          style: CustomTextStyle.body3(context)
              .copyWith(color: _isActive ? kPrimaryWhite : kPrimaryDarkPurple),
        ),
      ),
    );
  }
}
