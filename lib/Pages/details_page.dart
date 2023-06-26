import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/Pages/home_page.dart';
import '../Components/detail_field.dart';
import '../bloc/app_bloc.dart';
import '../constants.dart';
import '../models/product.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isExp = false;
  DateTime? expDate;

  @override
  void initState() {
    super.initState();
    expDate = DateTime(
                    widget.product.expType == "Year"
                        ? widget.product.date!.year + widget.product.expTime!
                        : widget.product.date!.year,
                    widget.product.expType == "Month"
                        ? widget.product.date!.month + widget.product.expTime!
                        : widget.product.date!.month,
                    widget.product.expType == "Day"
                        ? widget.product.date!.day + widget.product.expTime!
                        : widget.product.date!.day,
                  );

    isExp =
        ((expDate!.difference(DateTime.now()).inDays + 1) > 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryDarkPurple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 64,
        centerTitle: true,
        title: Text(
          "ข้อมูลสินค้า",
          style: CustomTextStyle.heading1(context)
              .copyWith(color: kPrimaryDarkPurple),
        ),
        actions: [
          PopupMenuButton(
              surfaceTintColor: kPrimaryWhite,
              offset: const Offset(-18, 44),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "แก้ไขข้อมูล",
                            style: CustomTextStyle.heading2(context)
                                .copyWith(color: kPrimaryDarkPurple),
                          ),
                          const Icon(
                            Icons.edit_outlined,
                            size: 24,
                            color: kPrimaryDarkPurple,
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: (){
                        context.read<AppBloc>().add(DeleteProductEvent(delName: widget.product.name));
                        Navigator.of(context).pop();
                        setState(() {
                          
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ลบข้อมูล",
                            style: CustomTextStyle.heading2(context)
                                .copyWith(color: kDanger),
                          ),
                          const Icon(
                            Icons.delete_outline,
                            size: 24,
                            color: kDanger,
                          )
                        ],
                      ),
                    ),
                  ])
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รายละเอียดสินค้า",
                style: CustomTextStyle.body2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
              const SizedBox(
                height: 24,
              ),
              DetailField(
                label: "ชื่อสินค้า",
                detail: "${widget.product.name}",
              ),
              const SizedBox(
                height: 16,
              ),
              DetailField(
                label: "Serial Number",
                detail: "${widget.product.serial}",
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "รายละเอียดสินค้า",
                style: CustomTextStyle.body2(context)
                    .copyWith(color: kPrimaryDarkPurple),
              ),
              const SizedBox(
                height: 24,
              ),
              DetailField(
                  label: "ช่วงเวลารับประกัน",
                  detail:
                      "${widget.product.date.toString().split(" ")[0].replaceAll("-", "/")} - ${DateTime(
                    widget.product.expType == "Year"
                        ? widget.product.date!.year + widget.product.expTime!
                        : widget.product.date!.year,
                    widget.product.expType == "Month"
                        ? widget.product.date!.month + widget.product.expTime!
                        : widget.product.date!.month,
                    widget.product.expType == "Day"
                        ? widget.product.date!.day + widget.product.expTime!
                        : widget.product.date!.day,
                  ).toString().split(" ")[0].replaceAll("-", "/")}"),
              const SizedBox(
                height: 16,
              ),
              DetailField(
                label: "ระยะประกัน",
                detail: widget.product.expType == 'Year'
                    ? "${widget.product.expTime} ปี"
                    : widget.product.expType == 'Month'
                        ? "${widget.product.expTime} เดือน"
                        : "${widget.product.expTime} วัน",
              ),
              const SizedBox(
                height: 16,
              ),
              DetailField(
                label: "ผู้รับประกัน",
                detail: "${widget.product.insurer}",
              ),
              const SizedBox(
                height: 16,
              ),
              DetailField(
                label: "ประกันคงเหลือ",
                detail: isExp
                    ? "${expDate!.difference(DateTime.now()).inDays + 1} วัน"
                    : "หมดอายุประกัน",
                isExp: !isExp,
              ),
            ],
          )),
    );
  }
}
