import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../model/news_model.dart';
import '../repos/repositories.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepositories _newsRepositories;

  NewsBloc(this._newsRepositories) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      // debugPrint('You emitted the first state');
      try{
        final news = await _newsRepositories.getNews();
        // debugPrint('You emitted the second state');
        emit(NewsLoadedState(news));
      }catch(e){
        emit(NewsErrorState(e.toString()));
      }

    });
  }
}
