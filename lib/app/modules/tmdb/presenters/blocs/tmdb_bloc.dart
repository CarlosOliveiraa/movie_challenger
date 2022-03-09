

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';

import 'tmdb_events.dart';
import 'tmdb_states.dart';

class TmdbBloc extends Bloc<TmdbEvent, BlocStates>{

  final ITmdbUsecase usecase;


  TmdbBloc(this.usecase) : super(BlocStart()){
    on<InitialEvent>(showTitle);
  }

  showTitle(InitialEvent event, Emitter<BlocStates> emit) async {
    emit(BlocLoad());
    final result = await usecase();
    emit(result.fold((l) => BlocError(), (r) => BlocSuccess(r)));
  }
}