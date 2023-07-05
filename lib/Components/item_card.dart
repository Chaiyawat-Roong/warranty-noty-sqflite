import 'package:flutter/material.dart';
import 'package:warranty_noty/models/product.dart';

import '../constants.dart';

class ItemCard extends StatefulWidget {
  final Product? product;

  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime expDate = DateTime(
                    widget.product!.exptype == "Year"
                        ? widget.product!.date!.year + widget.product!.exptime!
                        : widget.product!.date!.year,
                    widget.product!.exptype == "Month"
                        ? widget.product!.date!.month + widget.product!.exptime!
                        : widget.product!.date!.month,
                    widget.product!.exptype == "Day"
                        ? widget.product!.date!.day + widget.product!.exptime!
                        : widget.product!.date!.day,
                  );
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.product!.name}",
                  style: CustomTextStyle.heading2(context)
                      .copyWith(color: kPrimaryDarkPurple),
                ),
                const SizedBox(height: 4),
                Text(
                  "${widget.product!.date.toString().split(" ")[0].replaceAll("-", "/")} - ${expDate.toString().split(" ")[0].replaceAll("-", "/")}",
                  style: CustomTextStyle.body3(context)
                      .copyWith(color: kSecondaryGrey),
                )
              ],
            ),
          ),
          Column(
            children: (expDate.difference(DateTime.now()).inDays + 1) > 0
                ? [
                    Text(
                      "คงเหลือ",
                      style: CustomTextStyle.body3(context)
                          .copyWith(color: kSecondaryGrey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${expDate.difference(DateTime.now()).inDays + 1} วัน",
                      style: CustomTextStyle.heading2(context)
                          .copyWith(color: kPrimaryDarkPurple),
                    ),
                  ]
                : [
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
