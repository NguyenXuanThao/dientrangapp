import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../constant/dt_icon.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                _buildBody(context),
                _buildBottom(context)
              ],
            )),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Expanded(
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {
    return _buildItemCart(context);
  }));
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
      Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: const Text(
          'Giỏ hàng',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Widget _buildBottom(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tổng',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3.450.000 VNĐ',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.green3Color),
            ),
          ],
        ),

        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 164,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border:
                  Border.all(color: Colors.green, width: 1)),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  textColor: Colors.green,
                  child: const Text('Mua hàng tiếp', style: TextStyle(fontSize: 18),),
                ),
            ),
            Container(
              width: 164,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.green),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () {},
                textColor: Colors.white,
                child: const Text('Thanh toán', style: TextStyle(fontSize: 18),),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildItemCart(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey6Color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    DTIcons.icFertilizerYellow,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Text(
                          'Phân hữu cơ vi sinh Trichomix 25 kg',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          DTIcons.icDelete,
                          color: AppColors.grey3Color,
                          width: 20,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '450.000 VNĐ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.green3Color),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(DTIcons.imgMinus),
                            )),
                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.green3Color),
                                ),
                              ),
                            )),
                        Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: Colors.black12, width: 1),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(DTIcons.imgPlus),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
