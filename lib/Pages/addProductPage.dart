import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:warranty_noty/Components/customDatepicker.dart';
import 'package:warranty_noty/Components/customExpInput.dart';
import 'package:warranty_noty/Components/itemCard.dart';
import 'package:warranty_noty/models/product.dart';

import '../Components/customTextfield.dart';
import '../constants.dart';

class AddProductPage extends StatefulWidget {
  final String? _hintLabel;
  const AddProductPage({super.key, String? hintLabel}) : _hintLabel = hintLabel;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _SerialController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _ExpController = TextEditingController();
  // void _showDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  // }

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
              Modular.to.pop();
            },
          ),
          toolbarHeight: 64,
          centerTitle: true,
          title: Text(
            "ข้อมูลสินค้า",
            style: CustomTextStyle.heading1(context)
                .copyWith(color: kPrimaryDarkPurple),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              CustomTextfield(
                hintText: "เช่น คีย์บอร์ด Logitech G512",
                hintLabel: "ชื่อสินค้า",
                controller: _NameController,
              ),
              CustomTextfield(
                hintText: "เลขซีเรียลหรือเลขรับประกันบนสินค้า",
                hintLabel: "Serial Number",
                controller: _SerialController,
              ),
              CustomDatePicker(
                hintText: "เลือกวัน/เดือน/ปี ที่ซื้อสินค้า",
                hintLabel: "วันที่ซื้อสินค้า",
                isDate: true,
                // onChanged: (value){
                //   return "";
                // },
                // validator: (){},
                controller: _DateController,
              ),
              CustomExpInput(hintLabel: "ระยะเวลา", hintText: "ระยะเวลารับประกัน", controller: _ExpController)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("${_SerialController.text} ${_NameController.text} ${_DateController.text}"),
          child: Text("data")
        ));
  }
}
