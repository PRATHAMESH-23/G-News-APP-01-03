import 'package:flutter/material.dart';

class NewsItem {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  NewsItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });
}

class NewsListView extends StatelessWidget {
  final List<NewsItem> newsItems;

  const NewsListView(
      {super.key, required this.newsItems}); // Constructor with list parameter

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final newsItem = newsItems[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  newsItem.imageUrl,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Text(
                  newsItem.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4.0),
                Text(
                  newsItem.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4.0),
                Text(
                  newsItem.date,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
