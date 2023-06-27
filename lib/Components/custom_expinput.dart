import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class CustomExpInput extends StatefulWidget {
  const CustomExpInput(
      {super.key,
      required String? hintLabel,
      required String? hintText,
      required this.controller,
      required this.onDropdownChange,
      this.selectedValue = "Day",
      bool isDate = false})
      : _hintLabel = hintLabel,
        _hintText = hintText;

  final String? _hintText;
  final String? _hintLabel;
  final TextEditingController controller;
  final Function onDropdownChange;
  final String selectedValue;

  @override
  State<CustomExpInput> createState() => _CustomExpInputState();
}

class _CustomExpInputState extends State<CustomExpInput> {
  @override
  Widget build(BuildContext context) {
    String _selectedValue = widget.selectedValue;
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
                    controller: widget.controller,
                    style: const TextStyle(color: Color(0xFF3F3E6D)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: widget._hintText,
                      hintStyle: CustomTextStyle.body2(context).copyWith(
                        color: kSecondaryGrey,
                      ),
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8,4,8,4),
                    decoration: BoxDecoration(
                        color: kBackgroundLightgrey,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      items: const [
                        DropdownMenuItem(
                            value: 'Day', child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('วัน'),
                            )),
                        DropdownMenuItem(
                            value: 'Month', child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('เดือน'),
                            )),
                        DropdownMenuItem(
                            value: 'Year', child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('ปี'),
                            )),
                      ],
                      onChanged: (newValue) {
                        // Handle dropdown value change
                        setState(() {
                          widget.onDropdownChange(newValue);
                          _selectedValue = newValue!;
                        });
                      },
                      style: CustomTextStyle.body2(context).copyWith(color: kPrimaryDarkPurple),
                      dropdownColor:
                          kBackgroundLightgrey, 
                      icon:
                          const Icon(Icons.arrow_drop_down), 
                      iconEnabledColor: kPrimaryDarkPurple,
                      elevation: 2, 
                      underline: Container(),
                      borderRadius: BorderRadius.circular(10),
                      isExpanded: true,
                      // Add more properties as per your customization needs
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
