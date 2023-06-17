import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/bloc/home_page_bloc.dart';
import 'package:warranty_noty/models/product.dart';

import '../constants.dart';

class ItemCard extends StatefulWidget {
  final Product? product;

  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final bool _isNotExp = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product!;
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
                "${widget.product!.name}",
                style: CustomTextStyle.heading2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
              const SizedBox(height: 4),
              Text(
                "${widget.product!.date.toString().split(" ")[0].replaceAll("-", "/")} - ${DateTime(
                  widget.product!.expType == "Year"
                      ? widget.product!.date!.year + widget.product!.expTime!
                      : widget.product!.date!.year,
                  widget.product!.expType == "Month"
                      ? widget.product!.date!.month + widget.product!.expTime!
                      : widget.product!.date!.month,
                  widget.product!.expType == "Day"
                      ? widget.product!.date!.day + widget.product!.expTime!
                      : widget.product!.date!.day,
                ).toString().split(" ")[0].replaceAll("-", "/")}",
                style: CustomTextStyle.body3(context)
                    .copyWith(color: kSecondaryGrey),
              )
            ],
          ),
          Column(
            children: _isNotExp
                ? [
                    Text(
                      "คงเหลือ",
                      style: CustomTextStyle.body3(context)
                          .copyWith(color: kSecondaryGrey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${DateTime(
                  widget.product!.expType == "Year"
                      ? widget.product!.date!.year + widget.product!.expTime!
                      : widget.product!.date!.year,
                  widget.product!.expType == "Month"
                      ? widget.product!.date!.month + widget.product!.expTime!
                      : widget.product!.date!.month,
                  widget.product!.expType == "Day"
                      ? widget.product!.date!.day + widget.product!.expTime!
                      : widget.product!.date!.day,
                ).difference(widget.product!.date!).inDays} วัน",
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
