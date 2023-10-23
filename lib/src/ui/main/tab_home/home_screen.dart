import 'package:example_project/pages/login_screen.dart';
import 'package:example_project/src/constant/data.dart';
import 'package:example_project/src/constant/dt_icon.dart';
import 'package:example_project/src/ui/main/cart_screen.dart';
import 'package:example_project/src/ui/main/list_news/news_screen.dart';
import 'package:example_project/src/ui/main/tab_home/tab_home_product_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/model/home/news_response.dart';
import '../../../data/model/home/product_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height = 316.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage(DTIcons.icHeaderHome),
            fit: BoxFit.fill,
            height: height + MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                _buildBody(context, DTDataProvide.products, DTDataProvide.news)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    Icons.account_circle,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget _buildBody(BuildContext context, List<ProductResponse> products,
    List<NewsResponse> news) {
  return Expanded(
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white, // Màu nền trắng
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), // Góc tròn bên trái
          topRight: Radius.circular(16.0), // Góc tròn bên phải
        ),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildBanner(context);
            } else if (index == 1) {
              return _buildTitleList(context, 'Danh mục sản phẩm');
            } else if (index == 2) {
              return _buildListProduct(context, products);
            } else if (index == 3) {
              return _buildTitleList(context, 'Thông tin tin tức');
            } else if (index == 4) {
              return _buildListNews(context, news);
            }
          }),
    ),
  );
}

Widget _buildBanner(BuildContext context) {
  return Column(
    children:  [
      Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
            child: Image.network(
              'https://dientrang.thietkeapp.asia/upload/banner/banner-image-1696001456.png'
            ),
          )),
      SizedBox(
        height: 16,
      )
    ],
  );
}

Widget _buildTitleList(BuildContext context, String title) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: 4,
              height: 16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.green,
                  shape: BoxShape.rectangle),
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      )
    ],
  );
}

Widget _buildListProduct(BuildContext context, List<ProductResponse> products) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: 340,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 100, mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          if (index == 9) {
            return TabHomeProductItem(
              onTap: () {
                if (kDebugMode) {
                  print('Xem thêm');
                }
              },
              name: 'Xem thêm',
              image: DTIcons.icMore,
            );
          } else {
            return TabHomeProductItem(
                onTap: () {
                  print('click item product');
                },
                name: products[index].name.toString(),
                image: products[index].img.toString());
          }
        },
        itemCount: products.length, // Tổng số mục
      ),
    ),
  );
}

Widget _buildListNews(BuildContext context, List<NewsResponse> news) {
  return SizedBox(
    height: 280,
    child: GridView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, mainAxisExtent: 240, mainAxisSpacing: 12),
      itemBuilder: (context, index) {
        return _buildNewsItem(context, news, index);
      },
      itemCount: news.length,
    ),
  );
}

Widget _buildNewsItem(
    BuildContext context, List<NewsResponse> news, int index) {
  String limitWordsTo11(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 11) {
      return text;
    } else {
      return '${words.sublist(0, 11).join(' ')}...';
    }
  }

  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const NewsScreen()));
    },
    child: Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  news[index].img.toString(),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news[index].title.toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(limitWordsTo11(news[index].description.toString()),
                          style: const TextStyle(fontSize: 16), maxLines: 2)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
