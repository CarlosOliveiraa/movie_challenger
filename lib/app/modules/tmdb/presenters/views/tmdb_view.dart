import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/controllers/categories_controller.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/search/tmdb_search_store.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_categorie_button.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_title_card.dart';

import '../triples/tmdb_states.dart';
import '../triples/tmdb_store.dart';
import 'components/custom_app_bar.dart';

class TmdbView extends StatefulWidget {
  const TmdbView({Key? key}) : super(key: key);
  @override
  State<TmdbView> createState() => _TmdbViewState();
}

class _TmdbViewState extends State<TmdbView> {
  final store = Modular.get<TmdbStore>();
  final searchStore = Modular.get<TmdbSearchStore>();
  final bloc = Modular.get<TmdbBloc>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    store.showTitle();
    // searchStore.getTitle(_searchTitle);
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
    final controller = CategoriesController();

    int _selected = 0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff171A31),
      drawer: const Drawer(),
      body: SafeArea(
        child: ScopedBuilder<TmdbStore, Exception, TmdbSuccess>(
          store: store,
          onError: (_, Exception? e) => Text("Deu ruim $e"),
          onLoading: (context) =>
              const Center(child: CircularProgressIndicator()),
              
          onState: (_, TmdbSuccess state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    width: MediaQuery.of(context).size.width),
                const Padding(
                  padding: EdgeInsets.only(left: 18, bottom: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        
                        return CustomCategoriesButtom(
                          onTap: () {
                            setState(() {
                              _selected = index;
                              print("toquei $_selected");
                            });
                          },
                          color: _selected == index
                              ? const Color(0xff2F40AE)
                              : const Color(0xff0F1122),
                              width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.01,
                          text: controller.categories[index],
                        );
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.titles.results.length,
                      itemBuilder: (context, index) {
                        return CustomTitleCards(
                            height: 150, result: state.titles.results[index]);
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
