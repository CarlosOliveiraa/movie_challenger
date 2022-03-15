import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/triples/search/tmdb_search_store.dart';
import 'package:movie_challenger/app/modules/tmdb/presenters/views/components/custom_title_card.dart';

import '../triples/search/tmdb_search_states.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171A31),
      body: SafeArea(
        child: ScopedBuilder<TmdbSearchStore, Exception, TmdbSearchSuccess>(
          onError: (_, Exception? e) => Text("Deu ruim $e"),
          onLoading: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
          onState: (_, TmdbSearchSuccess state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: const Text(
                    "Search result",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.titles.results.length,
                      itemBuilder: (context, index) {
                        return CustomTitleCards(
                            favoriteButton: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            favoriteIcon: _isFavorite == false
                                ? Icons.favorite_border
                                : Icons.favorite,
                            height: 150,
                            result: state.titles.results[index]);
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
