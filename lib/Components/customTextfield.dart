import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required String? hintLabel,
    required String? hintText,
    required this.controller,
    bool isDate = false
  })  : _hintLabel = hintLabel,
        _hintText = hintText,
        _isDate = isDate;
        

  final String? _hintText;
  final String? _hintLabel;
  final TextEditingController controller;
  final bool _isDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                _hintLabel!,
                style: CustomTextStyle.body2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kBackgroundLightgrey,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                controller: controller,
                autofocus: true,
                style: const TextStyle(color: Color(0xFF3F3E6D)),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: _hintText,
                  hintStyle: CustomTextStyle.body2(context).copyWith(
                    color: kSecondaryGrey,
                  ),
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ));
  }
}
