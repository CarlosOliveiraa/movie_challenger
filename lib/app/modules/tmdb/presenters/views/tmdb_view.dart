import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/blocs/tmdb_bloc.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/controllers/categories_controller.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/search/tmdb_search_store.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_categorie_button.dart';

import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_title_card.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/search_view.dart';

import '../controllers/text_controller.dart';
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
  int _selected = 0;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    store.showTitle();
  }

  @override
  Widget build(BuildContext context) {
    final controller = CategoriesController();
    final textController = TextController();
    String _searchTitle;
    
    

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xff171A31),
      drawer: const Drawer(),
      body: SafeArea(
        child: ScopedBuilder<TmdbStore, Exception, TmdbSuccess>(
          store: store,
          onError: (_, Exception? e) => Text("Deu ruim $e"),
          onLoading: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          onState: (_, TmdbSuccess state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  width: MediaQuery.of(context).size.width,
                  onChanged: (value) {
                    _searchTitle = value;
                  },
                  controller: textController.searchController,
                  searchTap: () {
                    searchStore.getTitle(textController.searchController.text);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const SearchView()),
                      ),
                    );
                  },
                ),
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
                          onTap: () {},
                          favoriteButton: () {
                            setState(
                              () {
                                _isFavorite = !_isFavorite;
                                print(_isFavorite);
                              },
                            );
                          },
                          favoriteIcon: _isFavorite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          height: 150,
                          result: state.titles.results[index]);
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
