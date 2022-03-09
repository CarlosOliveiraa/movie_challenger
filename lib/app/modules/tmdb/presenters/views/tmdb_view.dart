import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_events.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_states.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/tmdb_store.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_title_card.dart';

import '../triples/tmdb_states.dart';

class TmdbView extends StatefulWidget {
  const TmdbView({Key? key}) : super(key: key);
  @override
  State<TmdbView> createState() => _TmdbViewState();
}

class _TmdbViewState extends State<TmdbView> {
  // final store = Modular.get<TmdbStore>();
  final bloc = Modular.get<TmdbBloc>();

  @override
  void initState() {
    super.initState();
    // store.selectLoading;
    // store.selectState;
    // store.selectError;
    // store.observer(
    //  onError: (e) => debugPrint("$e"),
    //  onLoading: (isLoading) => debugPrint("$isLoading"),
    //  onState: (state) => debugPrint("$state"),
    // );
    bloc.add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171A31),
      appBar: AppBar(
        title: const Text("Teste"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<TmdbBloc, BlocStates>(
        bloc: bloc,
        builder: (context, state) {
          if (state is BlocStart) {
            return const Center(
              child: Text("Inicio"),
            );
          }
          if (state is BlocLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlocError) {
            return const Center(
              child: Text("Deu ruim"),
            );
          }
          final result = (state as BlocSuccess).titles;
          return ListView.builder(
              itemCount: result.results.length,
              itemBuilder: (context, index) {
                return CustomTitleCards(
                    height: 150, result: result.results[index]);
              });
        },
      ),
      // body: Center(
      //   child: Container(color: Colors.black),
      // ),
      // body: ScopedBuilder<TmdbStore, Error, TmdbSuccess>(
      //     store: store,
      //     onError: (_, Error? e) => Text("Deu ruim $e"),
      //     onLoading: (context) => const Center(child:  CircularProgressIndicator()),
      //     onState: (_, TmdbSuccess state) {
      //       // return Container(
      //       //   color: ,
      //       // );
      //       return ListView(
      //         children: [
      //           Text(state.title.results[0].backDropPath)
      //         ],
      //       );
      //     }),
    );
  }
}
