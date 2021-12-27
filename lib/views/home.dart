import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/views/widgets/category_tile.dart';
import 'package:news_app/views/widgets/custom_appbar.dart';

import 'widgets/news_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<Article> news = [];
  bool isLoading = true;

  @override
  void initState() {
    categories = CategoryModel.categories;
    news = NewsApiService.articles;
    if (news.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : appBodyContent(),
    );
  }

  appBodyContent() => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    image: categories[index].imageUrl,
                    name: categories[index].name,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: news.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return NewsTile(
                    image: news[index].imageUrl,
                    title: news[index].title,
                    description: news[index].description,
                    content: news[index].newsContent ?? "",
                    newsUrl: news[index].newsUrl,
                  );
                },
              ),
            )
          ],
        ),
      );
}
