import 'package:example_project/src/ui/main/tab_product/product_screen.dart';
import 'package:flutter/material.dart';

import '../src/ui/main/tab_account/account_screen.dart';
import '../src/ui/main/tab_home/home_screen.dart';
import '../src/ui/main/tab_order/order_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomeScreen(),
    ProductScreen(),
    OrderScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.propane_tank), label: 'Sản phẩm'),
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Đơn hàng'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_sharp), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
