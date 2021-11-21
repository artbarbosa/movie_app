import 'package:dio/dio.dart';

import 'dio_service.dart';

class DioServiceImp implements DioService {
  @override
  getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YTQyNTExNTBlOTg5OGQ4NWI0Y2UzMThjODczMTQ5OSIsInN1YiI6IjYxOTc5ZmYxOTUxMmUxMDA4OGQ5ZjU1YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6bbJ0UZlqnjG-XjKpAASX4mUaBowoc2Bz2FLI9eJhK0',
        },
      ),
    );
  }
}
