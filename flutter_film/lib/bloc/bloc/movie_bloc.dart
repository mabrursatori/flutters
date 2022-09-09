import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_film/models/models.dart';
import 'package:flutter_film/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_film/shared/shared.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  // MovieBloc() : super(MovieInitial());

  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovies) {
      List<Movie> movies = await MovieServices.getMovies(1);

      for (int i = 1; i <= 5; i++) {
        var list = await MovieServices.getMovies(i);
        list.forEach((e) {
          listMovies.add(e);
        });
      }

      yield MovieLoaded(movies: movies);
    }
  }
}
