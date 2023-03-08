
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';

abstract class SearchStates{}

class InitialSearchStates extends SearchStates{}
class LoadingSearchStates extends SearchStates{}
class SuccessSearchStates extends SearchStates{
  final List<BookModel> book;

  SuccessSearchStates(this.book);
}
class FailureSearchStates extends SearchStates{

  final String ermessage;

  FailureSearchStates(this.ermessage);
}