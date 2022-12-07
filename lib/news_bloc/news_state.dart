part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<ArticlesItem> newsModelList;
  NewsLoadedState(this.newsModelList);

  @override
  List<Object> get props => [newsModelList];
}

class NewsErrorState extends NewsState {
  String message;

  NewsErrorState(this.message);

  @override
  List<Object> get props => [message];
}