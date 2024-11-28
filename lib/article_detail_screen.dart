import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article['title'] ?? 'No Title',
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Color.fromARGB(255, 57, 55, 161),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article image
            article['urlToImage'] != null
                ? Image.network(article['urlToImage'])
                : Icon(Icons.article, size: 100, color: Colors.grey),
            SizedBox(height: 16),


            Text(
              article['title'] ?? 'No Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Content of the article
            Text(
              article['content'] ?? 'No Content Available',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),


            Text(
              'Source: ${article['source']['name'] ?? 'Unknown'}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),


            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullArticleScreen(article: article),
                  ),
                );
              },
              icon: Icon(Icons.read_more),
              label: Text('Read Full Article'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 57, 55, 161),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullArticleScreen extends StatelessWidget {
  final Map<String, dynamic> article;

  FullArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Article'),
        backgroundColor: Color.fromARGB(255, 57, 55, 161),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article title
            Text(
              article['title'] ?? 'No Title',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // Full article content
            Text(
              article['content'] ?? 'No additional content available',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),

            if (article['description'] != null)
              Text(
                article['description']!,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
          ],
        ),
      ),
    );
  }
}
