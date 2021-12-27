class Article {
  late String title;
  late String? author;
  late String description;
  late String imageUrl;
  late DateTime publishDate;
  late String? newsContent;
  late String newsUrl;

  Article({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.author,
    this.newsContent,
    required this.newsUrl,
    required this.publishDate,
  });
}
