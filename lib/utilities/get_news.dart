import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article_class.dart';

Future<List<ArticleClass>> getNews(String api) async {
  try {
    var uri = Uri.parse(api);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var articles = body['articles'] as List<dynamic>;

      // Create an empty list to hold valid articles
      List<ArticleClass> articleList = [];

      // Use a for loop to filter and process articles
      for (var article in articles) {
        if (article['urlToImage'] != null && article['urlToImage'].isNotEmpty) {
          articleList.add(ArticleClass(
            title: article['title'] ?? "No Title",
            author: article['author'],
            content: article['content'],
            description: article['description'],
            publishedat: article['publishedAt'],
            url: article['url'],
            urltoimage: article['urlToImage'],
            id: article['source']['id'],
            name: article['source']['name'],
          ));
        }
      }

      return articleList;
    } else {
      throw Exception("Failed to fetch articles: ${response.statusCode}");
    }
  } catch (e) {
    print('Error: $e');
    throw Exception("Error fetching news: $e");
  }
}
