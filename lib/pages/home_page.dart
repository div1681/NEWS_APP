import 'package:flutter/material.dart';
import 'package:news_app/pages/profile_page.dart';
import 'package:news_app/utilities/get_news.dart';
import 'package:news_app/utilities/my_button.dart';
import 'package:news_app/utilities/article_class.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleClass> savedArticles = [];

  void saveArticle(ArticleClass article) {
    setState(() {
      savedArticles.add(article);
    });
  }

  String selectedAPI = " ";
  late Future<List<ArticleClass>> gotArticles;

  void getArticles(String api) {
    setState(() {
      selectedAPI = api;
      gotArticles = getNews(selectedAPI);
    });
  }

  @override
  void initState() {
    super.initState();
    getArticles(
        'https://newsapi.org/v2/top-headlines?category=general&apiKey=2004aea50dd449c9b8ea63e87d203708');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Text(
            "NewsApp",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 0),
            child: IconButton(
              icon: Icon(
                Icons.assignment_ind_outlined,
                size: 42,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              MyButton(
                label: "Tech",
                onPressed: () {
                  getArticles(
                      "https://newsapi.org/v2/top-headlines?category=technology&apiKey=2004aea50dd449c9b8ea63e87d203708");
                },
              ),
              MyButton(
                label: "Sports",
                onPressed: () {
                  getArticles(
                      "https://newsapi.org/v2/top-headlines?category=sports&apiKey=2004aea50dd449c9b8ea63e87d203708");
                },
              ),
              MyButton(
                label: "Cinema",
                onPressed: () {
                  getArticles(
                      "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=2004aea50dd449c9b8ea63e87d203708");
                },
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ArticleClass>>(
              future: gotArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final articles = snapshot.data!;
                    return Padding(
                      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                      child: Container(
                        child: ListView.builder(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber[100],
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(18),
                                            topRight: Radius.circular(18),
                                          ),
                                          child: Image.network(
                                            article.urltoimage,
                                            //height: 250,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: IconButton(
                                              onPressed: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => Saved(
                                                //         savedArticles:
                                                //             savedArticles),
                                                //   ),
                                                // );
                                                // saveArticle(article);
                                                // ScaffoldMessenger.of(context)
                                                //     .showSnackBar(SnackBar(
                                                //   content: Text(
                                                //       '${article.title} has been saved!'),
                                                // ));
                                              },
                                              icon: Image.asset(
                                                'lib/icons/saved.png',
                                                height: 32,
                                                width: 32,
                                                color: Colors.amber[300],
                                              ),
                                            )),
                                        Positioned(
                                            top: 10,
                                            left: 15,
                                            child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Text(
                                                  article.name ?? '',
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.amber[100],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(18),
                                          bottomRight: Radius.circular(18),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child: Text(
                                        article.title,
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Text('Something unexpected happened.'),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.amber[50],
    );
  }
}
