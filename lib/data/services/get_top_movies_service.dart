
import 'package:dio/dio.dart';
import 'package:movienest/constants/constants.dart';

import '../models/movies_model.dart';

class GetTopMoviesService{
  Dio dio=Dio();


  Future<MoviesModel> getTopMovies(int page) async{
    try {
      Response response = await dio.get(
          "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&page=$page");
      return MoviesModel.fromJson(response.data);
    }catch(e){
      throw e;
    }
  }
}