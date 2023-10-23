import 'package:example_project/src/constant/dt_icon.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(DTIcons.bgLogin), fit: BoxFit.fill)),
          child: Column(
            children: [_buildHeader(context), _buildBody(context)],
          ),
        ),
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
        'Chi tiết Tin tức',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ],
  );
}

Widget _buildBody(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(DTIcons.imgNews, fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey6Color,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trồng rải vụ theo hướng hữu cơ, nhãn Sông Mã đắt như tôm tươi',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Trên đường lên thăm các đồi nhãn VietGAP của HTX Hoa Mười ở xã Chiềng Khoong, Sông Mã (Sơn La), chúng tôi luôn phải ở trong tâm trạng thấp thỏm bởi để lên được các nhà vườn này, phải chạy xe máy men theo những lối mòn gồ ghề, khúc khuỷu, rộng bằng già gang tay, chênh vênh trên lưng chừng núi.Vườn nhãn của anh Lường Văn Mười rộng chừng 5ha ở bên sườn đồi cao gần 200m so với mực nước biển, đất canh tác thuộc loại feralit đỏ vàng giàu dinh dưỡng. Anh Mười kể, đây là phần nương rẫy của thân sinh anh để lại cho con cháu gieo ngô, trồng sắn kiếm sống. Nhưng đến đời anh Mười bị bỏ hoang mất một thời gian dài do có giai đoạn anh bỏ đi làm dịch vụ lái xe taxi, rồi lại về kinh doanh hàng',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
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
