import 'package:dio/dio.dart';

import 'models/models.dart';

class NewsFeedRepo {
  Future<List<NewsFeed>> getNewsFeed() async {
    try {
      final response = await Dio().get(
        "https://newsapi.org/v2/everything?q=apple&from=2024-01-20&to=2024-01-20&sortBy=popularity&apiKey=aa669e41a1b04698881b53445f2210ee",
      );
      final data = response.data as Map<String, dynamic>;
      final articles = data['articles'] as List<dynamic>;

      final newsArticleList = articles.map((article) {
        final author = article['author'] as String? ?? "Unknown Author";
        final title = article['title'] as String? ?? "No Title";
        final description =
            article['description'] as String? ?? "No Description";
        final publishedTime =
            article['publishedAt'] as String? ?? "Unknown Time";
        final imageURL = article['urlToImage'] as String? ?? "No image";

        return NewsFeed(
          title: title,
          description: description,
          publishedTime: publishedTime,
          author: author,
          imageURL: imageURL,
        );
      }).toList();

      return newsArticleList;
    } catch (e) {
      // Handle errors here
      print("Error fetching news feed: $e");
      return [];
    }
  }
}
