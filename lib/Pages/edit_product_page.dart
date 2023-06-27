import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/custom_datepicker.dart';
import '../Components/custom_expinput.dart';
import '../Components/custom_textfield.dart';
import '../bloc/app_bloc.dart';
import '../constants.dart';
import '../models/product.dart';

class EditProductPage extends StatefulWidget {
  final Product product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final TextEditingController _SerialController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _ExpController = TextEditingController();
  String _selectedValue = "Day";
  final TextEditingController _InsurerController = TextEditingController();
  String checkEmpty = "12345";

  @override
  void initState() {
    super.initState();
    _SerialController.text = widget.product.serial!;
    _NameController.text = widget.product.name!;
    _DateController.text = widget.product.date.toString().split(" ")[0].replaceAll("-", "/");
    _ExpController.text = widget.product.expTime.toString();
    _selectedValue = widget.product.expType!;
    _InsurerController.text = widget.product.insurer!;
  }

  void onDropdownChanged(String newValue) {
    setState(() {
      _selectedValue = newValue;
    });
  }

  void _onTextChanged() {
    String result = (_NameController.text != "" ? "1" : "") +
        (_SerialController.text != "" ? "2" : "") +
        (_DateController.text != "" ? "3" : "") +
        (_ExpController.text != "" ? "4" : "") +
        (_InsurerController.text != "" ? "5" : "");
    setState(() {
      checkEmpty = result;
    });
  }

  void _disposed() {
    _SerialController.dispose();
    _NameController.dispose();
    _ExpController.dispose();
    _InsurerController.dispose();
    _DateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _NameController.addListener(_onTextChanged);
    _SerialController.addListener(_onTextChanged);
    _DateController.addListener(_onTextChanged);
    _ExpController.addListener(_onTextChanged);
    _InsurerController.addListener(_onTextChanged);
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
          "จดวันรับประกันสินค้า",
          style: CustomTextStyle.heading1(context)
              .copyWith(color: kPrimaryDarkPurple),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                CustomExpInput(
                  hintLabel: "ระยะเวลารับประกัน",
                  hintText: "ระยะเวลารับประกัน",
                  controller: _ExpController,
                  selectedValue: _selectedValue,
                  onDropdownChange: onDropdownChanged,
                ),
                CustomTextfield(
                  hintText: "เช่น SYNNEX",
                  hintLabel: "ผู้รับประกัน",
                  controller: _InsurerController,
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: checkEmpty != "12345"
                      ? null
                      : () {
                          Product productToEdit = Product(
                              id: widget.product.id,
                              name: _NameController.text,
                              serial: _SerialController.text,
                              date: DateTime.parse(
                                  _DateController.text.replaceAll("/", "-")),
                              expTime: int.parse(_ExpController.text),
                              expType: _selectedValue,
                              insurer: _InsurerController.text);
                          context
                              .read<AppBloc>()
                              .add(EditProductEvent(product: productToEdit));
                          context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                          const snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape:  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            content: Text(
                              'บันทึกวันรับประกันสินค้าแล้ว',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackBar);
                          Navigator.pop(context, () {
                            _disposed();
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: checkEmpty == "12345"
                        ? kPrimaryPurple
                        : const Color(0xFFE3E3E4),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Text(
                        "บันทึก",
                        style: checkEmpty == "12345"
                            ? CustomTextStyle.body3(context)
                                .copyWith(color: kPrimaryWhite)
                            : CustomTextStyle.body3(context)
                                .copyWith(color: const Color(0xFF98979A)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}