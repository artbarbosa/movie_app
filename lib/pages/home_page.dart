import 'package:flutter/material.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/decorators/movies_cache_repository_cache.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repositories/movies_repository_imp.dart';
import 'package:movie_app/service/dio_service_imp.dart';
import 'package:movie_app/widgets/custom_list_card_widget.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImp(
        DioServiceImp(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.05),
                                Colors.grey.withOpacity(0.15),
                                Colors.grey.withOpacity(0.05),
                              ],
                              stops: const [0, 7, 1],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: _controller.onChanged,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    fillColor: Colors.white30,
                                    focusColor: Colors.white30,
                                    hoverColor: Colors.white30,
                                  ),
                                  cursorColor: Colors.white30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listMovies[idx]),
                          separatorBuilder: (_, __) => const Divider(),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
