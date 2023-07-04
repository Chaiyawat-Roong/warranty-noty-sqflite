import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:warranty_noty/Components/custom_datepicker.dart';
import 'package:warranty_noty/Components/custom_expinput.dart';
import 'package:warranty_noty/bloc/app_bloc.dart';
import 'package:warranty_noty/models/product.dart';

import '../Components/custom_textfield.dart';
import '../constants.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _expController = TextEditingController();
  String _selectedValue = "Day";
  final TextEditingController _insurerController = TextEditingController();
  String checkEmpty = "";

  @override
  void initState() {
    super.initState();
  }

  void onDropdownChanged(String newValue) {
    setState(() {
      _selectedValue = newValue;
    });
  }

  void _onTextChanged() {
    String result = (_nameController.text != "" ? "1" : "") +
        (_serialController.text != "" ? "2" : "") +
        (_dateController.text != "" ? "3" : "") +
        (_expController.text != "" ? "4" : "") +
        (_insurerController.text != "" ? "5" : "");
    setState(() {
      checkEmpty = result;
    });
  }

  void _disposed() {
    _serialController.dispose();
    _nameController.dispose();
    _expController.dispose();
    _insurerController.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.addListener(_onTextChanged);
    _serialController.addListener(_onTextChanged);
    _dateController.addListener(_onTextChanged);
    _expController.addListener(_onTextChanged);
    _insurerController.addListener(_onTextChanged);
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
                  controller: _nameController,
                ),
                CustomTextfield(
                  hintText: "เลขซีเรียลหรือเลขรับประกันบนสินค้า",
                  hintLabel: "Serial Number",
                  controller: _serialController,
                ),
                CustomDatePicker(
                  hintText: "เลือกวัน/เดือน/ปี ที่ซื้อสินค้า",
                  hintLabel: "วันที่ซื้อสินค้า",
                  isDate: true,
                  // onChanged: (value){
                  //   return "";
                  // },
                  // validator: (){},
                  controller: _dateController,
                ),
                CustomExpInput(
                  hintLabel: "ระยะเวลารับประกัน",
                  hintText: "ระยะเวลารับประกัน",
                  controller: _expController,
                  selectedValue: _selectedValue,
                  onDropdownChange: onDropdownChanged,
                ),
                CustomTextfield(
                  hintText: "เช่น SYNNEX",
                  hintLabel: "ผู้รับประกัน",
                  controller: _insurerController,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: checkEmpty != "12345"
                      ? null
                      : () {
                        var uuid = const Uuid();
                        var generatedUuid = uuid.v4();
                          Product productToAdd = Product(
                              id: generatedUuid.toString(),
                              name: _nameController.text,
                              serial: _serialController.text,
                              date: DateTime.parse(
                                  _dateController.text.replaceAll("/", "-")),
                              exptime: int.parse(_expController.text),
                              exptype: _selectedValue,
                              insurer: _insurerController.text);
                          context
                              .read<AppBloc>()
                              .add(AddProductEvent(product: productToAdd));
                          // context.read<AppBloc>().add(HomePageSelectEvent(index: 0));
                          const snackBar = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            content: Text(
                              'บันทึกวันรับประกันสินค้าแล้ว',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pop(context, (){
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
