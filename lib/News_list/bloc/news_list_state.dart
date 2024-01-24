part of "news_list_bloc.dart";

class NewsListState {
  get newsList => null;
}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  NewsListLoaded({required this.newsList});
  final List<NewsFeed> newsList;
}

class NewsListLoadingFailure extends NewsListState {
  NewsListLoadingFailure({required this.exception});
  final Object? exception;
}
