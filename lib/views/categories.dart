import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/views/widgets/news_tile.dart';

class CategoriesView extends StatefulWidget {
  final String newsCategory;

  const CategoriesView({
    Key? key,
    required this.newsCategory,
  }) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  bool isLoading = true;
  List<Article> newsList = [];

  @override
  void initState() {
    fetchNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            CategoryNews.categoryNews.clear();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.newsCategory,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: newsList.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsTile(
                      image: newsList[index].imageUrl,
                      title: newsList[index].title,
                      description: newsList[index].description,
                      content: newsList[index].newsContent ?? "No Content",
                      newsUrl: newsList[index].newsUrl,
                    );
                  },
                ),
              ),
            ),
    );
  }

  void fetchNews() async {
    await CategoryNews.getNewsByCategory(widget.newsCategory);
    newsList = CategoryNews.categoryNews;
    if (newsList.isNotEmpty) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
