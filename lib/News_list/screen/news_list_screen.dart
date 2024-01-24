import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/News_list/bloc/news_list_bloc.dart';

import '../../Repositories/News_Feed/news_feed.dart';
import '../widgets/widgets.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final _newsListBloc = NewsListBloc(NewsFeedRepo());

  void initState() {
    super.initState();
    _newsListBloc.add(LoadNewsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NewsFeed",
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return _newsListBloc.add(LoadNewsList());
        },
        child: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: _newsListBloc,
          builder: (context, state) {
            print("Received data in UI: ${state.newsList}");
            if (state is NewsListLoaded) {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  final newsContent = state.newsList[index];
                  return NewsTile(
                    newsContent: newsContent,
                  );
                },
              );
            }
            if (state is NewsListLoadingFailure) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    _newsListBloc.add(LoadNewsList());
                  },
                  child: Text(
                    "Try again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
