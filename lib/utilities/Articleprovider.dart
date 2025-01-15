import 'package:flutter/foundation.dart';
import 'package:news_app/utilities/article_class.dart';

class SavedArticlesProvider with ChangeNotifier {
  final List<ArticleClass> _savedArticles = [];

  List<ArticleClass> get savedArticles => _savedArticles;

  void addArticle(ArticleClass article) {
    _savedArticles.add(article);
    notifyListeners(); // Notify UI to rebuild
  }

  void removeArticle(ArticleClass article) {
    _savedArticles.remove(article);
    notifyListeners();
  }
}
