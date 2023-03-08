

import 'package:bookly_app/Features/Search/data/repo/repo_search.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoSearchImp implements HomeRepoSearch{
  final ApiService apiService;

  HomeRepoSearchImp(this.apiService);



  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String name}) async {
    try{
      var result = await apiService.get(endpoints: 'volumes?Filtering=free-ebooks&q=subject:$name ');

      List<BookModel> books = [];
      for (var item in result['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);

    }catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e)) ;
      }return left(ServerFailure(e.toString()));

    }
  }


}





