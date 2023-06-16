import 'package:flutter/material.dart';

import '../constants.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final bool _isNotExp = true;

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 15,
                color: kSecondaryGrey.withOpacity(0.15)),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "คีย์บอร์ด Logitech G512",
                style: CustomTextStyle.heading2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
              const SizedBox(height: 4),
              Text(
                "13/06/2023 - 13/06/2025",
                style: CustomTextStyle.body3(context)
                    .copyWith(color: kSecondaryGrey),
              )
            ],
          ),
          Column(
            children: _isNotExp ? [
              Text(
                "คงเหลือ",
                style: CustomTextStyle.body3(context)
                    .copyWith(color: kSecondaryGrey),
              ),
              const SizedBox(height: 4),
              Text(
                "726 วัน",
                style: CustomTextStyle.heading2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
            ] : [
              Text(
                "หมดอายุประกัน",
                style: CustomTextStyle.heading3(context)
                    .copyWith(color: kDanger),
              ),
            ],
          )
        ],
      ),
    );
  }
}