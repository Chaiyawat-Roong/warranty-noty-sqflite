import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_noty/Pages/edit_product_page.dart';
import '../Components/detail_field.dart';
import '../bloc/app_bloc.dart';
import '../constants.dart';
import '../models/product.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.id});
  final String id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isExp = false;
  DateTime? expDate;
  Product? product;

  @override
  void initState() {
    super.initState();
    product = context.read<AppBloc>().state.products!.firstWhere(
          (element) => element.id == widget.id,
          orElse: () => const Product(),
        );
    expDate = DateTime(
      product!.exptype == "Year"
          ? product!.date!.year + product!.exptime!
          : product!.date!.year,
      product!.exptype == "Month"
          ? product!.date!.month + product!.exptime!
          : product!.date!.month,
      product!.exptype == "Day"
          ? product!.date!.day + product!.exptime!
          : product!.date!.day,
    );
    isExp = ((expDate!.difference(DateTime.now()).inDays + 1) > 0);
  }

  void setExp() {
    setState(() {
      expDate = DateTime(
        product!.exptype == "Year"
            ? product!.date!.year + product!.exptime!
            : product!.date!.year,
        product!.exptype == "Month"
            ? product!.date!.month + product!.exptime!
            : product!.date!.month,
        product!.exptype == "Day"
            ? product!.date!.day + product!.exptime!
            : product!.date!.day,
      );
      isExp = ((expDate!.difference(DateTime.now()).inDays + 1) > 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
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
                    value: "edit",
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
                    value: "del",
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
                ],
                onSelected: (value){
                  if (value == 'edit') {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProductPage(product: product!))).whenComplete(() {
                                      setState(() {
                                        product = state.products!.firstWhere(
                                          (element) => element.id == widget.id,
                                          orElse: () => const Product(),
                                        );
                                      });
                                      setExp();
                                    });
                  } else if (value == 'del') {
                    context
                        .read<AppBloc>()
                        .add(DeleteProductEvent(delId: product!.id));
                    Navigator.of(context).pop();
                  }
                },
              )
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
                    label: "ชื่อสินค้า ${product!.name}",
                    detail: "${product!.name}",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "Serial Number",
                    detail: "${product!.serial}",
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
                          "${product!.date.toString().split(" ")[0].replaceAll("-", "/")} - ${expDate.toString().split(" ")[0].replaceAll("-", "/")}"),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "ระยะประกัน",
                    detail: product!.exptype == 'Year'
                        ? "${product!.exptime} ปี"
                        : product!.exptype == 'Month'
                            ? "${product!.exptime} เดือน"
                            : "${product!.exptime} วัน",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "ผู้รับประกัน",
                    detail: "${product!.insurer}",
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
      },
    );
  }
}
