import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/tmdb_store.dart';

import '../triples/tmdb_states.dart';

class TmdbView extends StatefulWidget {
  const TmdbView({Key? key}) : super(key: key);
  @override
  State<TmdbView> createState() => _TmdbViewState();
}

class _TmdbViewState extends State<TmdbView> {
  final store = Modular.get<TmdbStore>();

  @override
  void initState() {
    super.initState();
    store.selectLoading;
    store.selectState;
    store.selectError;
    store.observer(
     onError: (e) => debugPrint("$e"),
     onLoading: (isLoading) => debugPrint("$isLoading"),
     onState: (state) => debugPrint("$state"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste"),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Container(color: Colors.black),
      // ),
      body: ScopedBuilder<TmdbStore, Error, TmdbSuccess>(
          store: store,
          onError: (_, Error? e) => Text("Deu ruim $e"),
          onLoading: (context) => const Center(child:  CircularProgressIndicator()),
          onState: (_, TmdbSuccess state) {
            // return Container(
            //   color: ,
            // );
            return ListView(
              children: [
                Text(state.title.results[0].backDropPath)
              ],
            );
          }),
    );
  }
}
