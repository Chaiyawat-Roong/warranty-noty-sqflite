import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CustomExpInput extends StatelessWidget {
  const CustomExpInput(
      {super.key,
      required String? hintLabel,
      required String? hintText,
      required this.controller,
      bool isDate = false})
      : _hintLabel = hintLabel,
        _hintText = hintText;

  final String? _hintText;
  final String? _hintLabel;
  final TextEditingController controller;

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
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.56,
                  decoration: BoxDecoration(
                      color: kBackgroundLightgrey,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: kBackgroundLightgrey,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                ),
              ],
            ),
          ],
        ));
  }
}
