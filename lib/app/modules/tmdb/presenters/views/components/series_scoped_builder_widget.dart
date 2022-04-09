import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../triples/series/tmdb_series_store.dart';
import '../../triples/tmdb_states.dart';
import 'custom_title_card.dart';

class SeriesScopedBuildWidget extends StatelessWidget {
  final TmdbSeriesStore? store;

  const SeriesScopedBuildWidget({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<TmdbSeriesStore, Exception, TmdbSuccess>(
      store: store,
      onError: (_, Exception? e) => Text("Deu ruim $e"),
      onLoading: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      onState: (_, TmdbSuccess state) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: state.titles.results.length,
          itemBuilder: (context, index) {
            return CustomTitleCards(
                onTap: () {}, height: 150, result: state.titles.results[index]);
          },
        );
      },
    );
  }
}
