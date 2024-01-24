import "package:flutter/material.dart";
import "../../Repositories/News_Feed/models/models.dart";
import 'package:intl/intl.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.newsContent,
  });

  final NewsFeed newsContent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final DateTime publishedTime = DateTime.parse(newsContent.publishedTime);
    final formattedDate = DateFormat("d.M.y").format(publishedTime);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Image.network(
              newsContent.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  newsContent.title,
                  style: theme.bodyLarge,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Text(
                        formattedDate,
                        style: theme.bodySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        newsContent.author,
                        style: theme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  newsContent.description,
                  style: theme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
