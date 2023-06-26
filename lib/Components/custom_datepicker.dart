import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key,
      required String? hintLabel,
      required String? hintText,
      // required this.validator,
      // required this.onChanged,
      required this.controller,
      // required this.showDate,
      bool isDate = false})
      : _hintLabel = hintLabel,
        _hintText = hintText,
        _isDate = isDate;

  final String? _hintText;
  final String? _hintLabel;
  final bool _isDate;
  final TextEditingController controller;
  // final String? Function(String?)? validator;
  // final void Function(String)? onChanged;
  // final void Function()? showDate;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState(controller);
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final TextEditingController stateController;

  _CustomDatePickerState(this.stateController);

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        stateController.text = value.toString().split(" ")[0].replaceAll("-", "/");
      });
    });
  }

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
                widget._hintLabel!,
                style: CustomTextStyle.body2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kBackgroundLightgrey,
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                child: TextFormField(
                  // validator: widget.validator,
                  // onChanged: widget.onChanged,
                  controller: stateController,
                  style: const TextStyle(color: Color(0xFF3F3E6D)),
                  onTap: () => _showDatePicker(),
                  readOnly: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget._hintText,
                      hintStyle: CustomTextStyle.body2(context).copyWith(
                        color: kSecondaryGrey,
                      ),
                      suffixIcon: widget._isDate
                          ? const Icon(
                              Icons.calendar_month_outlined,
                              color: kPrimaryDarkPurple,
                            )
                          : const SizedBox(),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ),
          ],
        ));
  }
}
