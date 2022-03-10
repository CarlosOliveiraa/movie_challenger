import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_events.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_states.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_title_card.dart';

import '../triples/tmdb_states.dart';
import '../triples/tmdb_store.dart';

class TmdbView extends StatefulWidget {
  const TmdbView({Key? key}) : super(key: key);
  @override
  State<TmdbView> createState() => _TmdbViewState();
}

class _TmdbViewState extends State<TmdbView> {
  final store = Modular.get<TmdbStore>();
  final bloc = Modular.get<TmdbBloc>();

  @override
  void initState() {
    super.initState();
    store.showTitle();
    // store.selectLoading;
    // store.selectState;
    // store.selectError;
    // // store.observer(
    // //  onError: (e) => debugPrint("$e"),
    // //  onLoading: (isLoading) => debugPrint("$isLoading"),
    // //  onState: (state) => debugPrint("$state"),
    // // );
    // bloc.add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171A31),
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ],
      ),
      // body: BlocBuilder<TmdbBloc, BlocStates>(
      //   bloc: bloc,
      //   builder: (context, state) {
      //     if (state is BlocStart) {
      //       return const Center(
      //         child: Text("Inicio"),
      //       );
      //     }
      //     if (state is BlocLoad) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (state is BlocError) {
      //       return const Center(
      //         child: Text("Deu ruim"),
      //       );
      //     }
      //     final result = (state as BlocSuccess).titles;
      //     return SingleChildScrollView(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Padding(
      //             padding: EdgeInsets.only(left: 18),
      //             child: Text(
      //               "Categories",
      //               style: TextStyle(color: Colors.white, fontSize: 20),
      //             ),
      //           ),
      //           ListView.builder(
      //               scrollDirection: Axis.vertical,
      //               shrinkWrap: true,
      //               itemCount: result.results.length,
      //               itemBuilder: (context, index) {
      //                 return CustomTitleCards(
      //                     height: 150, result: result.results[index]);
      //               })
      //         ],
      //       ),
      //     );
      //   },
      // ),
      // body: Center(
      //   child: Container(color: Colors.black),
      // ),
      body: ScopedBuilder<TmdbStore, Exception, TmdbSuccess>(
        store: store,
        onError: (_, Exception? e) => Text("Deu ruim $e"),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
        onState: (_, TmdbSuccess state) {
          // return Container(
          //   color: ,
          // );
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.titles.results.length,
                    itemBuilder: (context, index) {
                      return CustomTitleCards(
                          height: 150, result: state.titles.results[index]);
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
