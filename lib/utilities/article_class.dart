class ArticleClass {
  final String? id;
  final String name;
  final String title;
  final String? author;
  final String? description;
  final String? url;
  final String urltoimage;
  final String publishedat;
  final String? content;

  ArticleClass({
    required this.title,
    required this.author,
    required this.content,
    required this.description,
    required this.publishedat,
    required this.url,
    required this.urltoimage,
    required this.id,
    required this.name,
  });
}
