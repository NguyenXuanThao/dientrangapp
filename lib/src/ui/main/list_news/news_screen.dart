import 'package:example_project/pages/news_detail_screen.dart';
import 'package:example_project/src/constant/data.dart';
import 'package:example_project/src/constant/dt_icon.dart';
import 'package:example_project/src/data/model/home/news_response.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

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
              children: [_buildHeader(context), _buildBody(context, DTDataProvide.news)],
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
      Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: const Text(
          'Tin tức',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Widget _buildBody(BuildContext context, List<NewsResponse> news) {
  return Expanded(
    child: ListView.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildNewsItem(context, index, news);
        }),
  );
}

Widget _buildNewsItem(
    BuildContext context, int index, List<NewsResponse> news) {
  String limitWordsTo13(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 13) {
      return text;
    } else {
      return '${words.sublist(0, 13).join(' ')}...';
    }
  }

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NewsDetailsScreen()));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    news[index].img.toString(),
                    width: 100,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news[index].title.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        limitWordsTo13(news[index].description.toString()),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
