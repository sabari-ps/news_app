import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  final String image, title, content;

  const ArticleView({
    Key? key,
    required this.image,
    required this.content,
    required this.title,
  }) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.network(
                  widget.image,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.content,
                  style: const TextStyle(
                    fontSize: 16.0,
                    wordSpacing: 4.0,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
