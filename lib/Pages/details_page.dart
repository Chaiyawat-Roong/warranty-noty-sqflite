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
  Product? product;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    product = context.read<AppBloc>().state.products!.firstWhere(
          (element) => element.id == widget.id,
          orElse: () => const Product(),
        );
    isExp = (DateTime(
              context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Year"
                  ? context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .year +
                      context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : context.read<AppBloc>().state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .year,
              context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Month"
                  ? context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .month +
                      context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : context.read<AppBloc>().state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .month,
              context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Day"
                  ? context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .day +
                      context.read<AppBloc>().state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : context.read<AppBloc>().state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .day,
            ).difference(DateTime.now()).inDays + 1) > 0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        product = context.read<AppBloc>().state.products!.firstWhere(
              (element) => element.id == widget.id,
              orElse: () => const Product(),
            );
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
                onSelected: (value) {
                  if (value == 'edit') {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProductPage(
                                    product: state.products!.firstWhere(
                                        (element) => element.id == widget.id))));
                  } else if (value == 'del') {
                    context.read<AppBloc>().add(DeleteProductEvent(
                        delId: state.products!
                            .firstWhere((element) => element.id == widget.id)
                            .id));
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
                    label: "ชื่อสินค้า",
                    detail:
                        "${state.products!.firstWhere((element) => element.id == widget.id).name}",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "Serial Number",
                    detail:
                        "${state.products!.firstWhere((element) => element.id == widget.id).serial}",
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
                          "${state.products!.firstWhere((element) => element.id == widget.id).date.toString().split(" ")[0].replaceAll("-", "/")} - ${DateTime(
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Year"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .year +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .year,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Month"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .month +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .month,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Day"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .day +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .day,
            ).toString().split(" ")[0].replaceAll("-", "/")}"),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "ระยะประกัน",
                    detail: state.products!
                                .firstWhere(
                                    (element) => element.id == widget.id)
                                .exptype ==
                            'Year'
                        ? "${state.products!.firstWhere((element) => element.id == widget.id).exptime} ปี"
                        : state.products!
                                    .firstWhere(
                                        (element) => element.id == widget.id)
                                    .exptype ==
                                'Month'
                            ? "${state.products!.firstWhere((element) => element.id == widget.id).exptime} เดือน"
                            : "${state.products!.firstWhere((element) => element.id == widget.id).exptime} วัน",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "ผู้รับประกัน",
                    detail:
                        "${state.products!.firstWhere((element) => element.id == widget.id).insurer}",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DetailField(
                    label: "ประกันคงเหลือ",
                    detail: ((DateTime(
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Year"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .year +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .year,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Month"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .month +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .month,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Day"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .day +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .day,
            ).difference(DateTime.now()).inDays + 1) > 0)
                        ? "${DateTime(
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Year"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .year +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .year,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Month"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .month +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .month,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Day"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .day +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .day,
            ).difference(DateTime.now()).inDays + 1} วัน"
                        : "หมดอายุประกัน",
                    isExp: !((DateTime(
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Year"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .year +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .year,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Month"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .month +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .month,
              state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptype ==
                      "Day"
                  ? state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .date!
                          .day +
                      state.products!
                          .firstWhere((element) => element.id == widget.id)
                          .exptime!
                  : state.products!
                      .firstWhere((element) => element.id == widget.id)
                      .date!
                      .day,
            ).difference(DateTime.now()).inDays + 1) > 0),
                  ),
                ],
              )),
        );
      },
    );
  }
}
