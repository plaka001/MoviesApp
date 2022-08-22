import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cine'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              ),
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MoveSlider(
                movies: moviesProvider.popularityMovies,
                title: 'Populares!',
                onNextPage: () {
                  moviesProvider.getPopularMovies();
                },
              )
            ],
          ),
        ));
  }
}
