import 'package:flutter/material.dart';

import '../constants.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    super.key,
    required this.detail,
    required this.label,
    this.isExp = false
  });

  final String detail;
  final String label;
  final bool isExp;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.35 ,child: Text(label, style: CustomTextStyle.body2(context).copyWith(color: kSecondaryGrey),)),
        Expanded(child: Text(detail, overflow: TextOverflow.clip, style: CustomTextStyle.heading2(context).copyWith(color: isExp ?  kDanger : kPrimaryDarkPurple ),)),
      ],
    );
  }
}