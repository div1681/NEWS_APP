import 'package:flutter/material.dart';
import 'package:news_app/utilities/article_class.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  //final List<ArticleClass> savedArticles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        leading: IconButton(
            icon: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Icon(Icons.arrow_back_outlined)),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
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
      ),
      // body: widget.savedArticles.isEmpty
      //     ? Center(
      //         child: Text(
      //           "No articles saved yet!",
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //         ),
      //       )
      //     : ListView.builder(
      //         itemCount: widget.savedArticles.length,
      //         itemBuilder: (context, index) {
      //           final article = widget.savedArticles[index];
      //           return Padding(
      //             padding: const EdgeInsets.only(top: 25.0),
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   color: Colors.amber[100],
      //                   borderRadius: BorderRadius.circular(18)),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Stack(
      //                     children: [
      //                       ClipRRect(
      //                         borderRadius: BorderRadius.only(
      //                           topLeft: Radius.circular(18),
      //                           topRight: Radius.circular(18),
      //                         ),
      //                         child: Image.network(
      //                           article.urltoimage,
      //                           height: 250,
      //                           width: double.infinity,
      //                           fit: BoxFit.cover,
      //                           loadingBuilder: (BuildContext context,
      //                               Widget child,
      //                               ImageChunkEvent? loadingProgress) {
      //                             if (loadingProgress == null) return child;
      //                             return Center(
      //                               child: CircularProgressIndicator(
      //                                 value:
      //                                     loadingProgress.expectedTotalBytes !=
      //                                             null
      //                                         ? loadingProgress
      //                                                 .cumulativeBytesLoaded /
      //                                             (loadingProgress
      //                                                     .expectedTotalBytes ??
      //                                                 1)
      //                                         : null,
      //                               ),
      //                             );
      //                           },
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Container(
      //                     decoration: BoxDecoration(
      //                       color: Colors.amber[100],
      //                       borderRadius: BorderRadius.only(
      //                         bottomLeft: Radius.circular(18),
      //                         bottomRight: Radius.circular(18),
      //                       ),
      //                     ),
      //                     padding: EdgeInsets.all(12),
      //                     child: Text(
      //                       article.title,
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16,
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       ),
    );
  }
}
