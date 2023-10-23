import 'package:flutter/material.dart';
import 'package:example_project/src/constant/dt_icon.dart';

import '../../../../theme/app_colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(DTIcons.bgLogin), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(context),
                _buildSearchProduct(context)
              ],
            )),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black12, width: 1),
                color: Colors.white),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_ios_new_outlined),
            )),
      ),
      const SizedBox(width: 20),
      const Text(
        'Sảm phẩm',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _buildSearchProduct(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.grey2Color),
          SizedBox(width: 4),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(color: AppColors.grey2Color),
                border: InputBorder.none,
              ),
              style: TextStyle(color: AppColors.grey2Color),
            ),
          ),
        ],
      ),
    ),
  );
}
