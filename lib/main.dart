import 'package:flutter/material.dart';
import 'package:news_app/services/news_api.dart';
import 'package:news_app/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NewsApiService.fetchNews();
  
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      home: HomePage(),
    );
  }
}
