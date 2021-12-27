import 'dart:convert';

import 'package:news_app/configs/app_constants.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class NewsApiService {
  static List<Article> articles = [];

  static Future<void> fetchNews() async {
    String baseUrl =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$apiKey";
    var response = await http.get(Uri.parse(baseUrl));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (article) {
          if (article['urlToImage'] != null && article['description'] != null) {
            articles.add(
              Article(
                author: article['author'],
                description: article['description'],
                title: article['title'],
                imageUrl: article['urlToImage'],
                newsContent: article['content'],
                newsUrl: article['url'],
                publishDate: DateTime.parse(article['publishedAt']),
              ),
            );
          }
        },
      );
    }
  }
}

class CategoryNews {
  static List<Article> categoryNews = [];

  static Future<void> getNewsByCategory(String category) async {
    String baseUrl =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";
    var response = await http.get(Uri.parse(baseUrl));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (article) {
          if (article['urlToImage'] != null && article['description'] != null) {
            categoryNews.add(
              Article(
                author: article['author'],
                description: article['description'],
                title: article['title'],
                imageUrl: article['urlToImage'],
                newsContent: article['content'],
                newsUrl: article['url'],
                publishDate: DateTime.parse(
                  article['publishedAt'],
                ),
              ),
            );
          }
        },
      );
    }
  }
}
