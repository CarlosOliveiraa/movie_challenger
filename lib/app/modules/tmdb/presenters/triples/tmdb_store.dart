// import 'package:flutter_triple/flutter_triple.dart';


// import 'package:movie_challenger/app/modules/tmdb/domain/usecases/tmdb_usecase.dart';

// import 'tmdb_states.dart';

// class TmdbStore extends StreamStore<Error, TmdbState> {
//   final ITmdbUsecase usecase;

//   TmdbStore(this.usecase) : super(TmdbSuccess());

//   Future<void> showTitle() async {
//     setLoading(true);
//     try {
//       final result = await usecase();
//       result.fold((l) => Error, (r) => update(HomeState(r)));
//     } catch (e) {
//       setError(Error());
//     } finally {
//       setLoading(false);
//     }
//   }
// }
