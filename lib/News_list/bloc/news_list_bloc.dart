import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsfeed/Repositories/News_Feed/models/news_feed_model.dart';

import '../../Repositories/News_Feed/news_feed.dart';
part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsFeedRepo newsFeed;
  NewsListBloc(this.newsFeed) : super(NewsListInitial()) {
    on<LoadNewsList>((event, emit) async {
      try {
        emit(NewsListLoading());
        final newsList = await newsFeed.getNewsFeed();
        emit(NewsListLoaded(newsList: newsList));
      } catch (e) {
        emit(NewsListLoadingFailure(exception: null));
      }
    });
  }

  
}
