import 'package:flutter/material.dart';

import 'package:flutter_triple/flutter_triple.dart';

import '../../triples/tmdb_states.dart';
import '../../triples/tmdb_store.dart';
import 'custom_title_card.dart';

class ScopedBuilderWidget extends StatelessWidget {
  final TmdbStore? store;

  const ScopedBuilderWidget({Key? key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<TmdbStore, Exception, TmdbSuccess>(
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
