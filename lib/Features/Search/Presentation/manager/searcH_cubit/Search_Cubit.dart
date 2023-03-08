import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/search_state.dart';
import 'package:bookly_app/Features/Search/data/repo/repo_search_imp.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/repo_search.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit(this.homeRepo) : super(InitialSearchStates());
final HomeRepoSearchImp homeRepo ;

static SearchCubit get(context)=> BlocProvider.of(context);

   void search({required String name}) async {
    emit(LoadingSearchStates());
    var result = await homeRepo.fetchSearchBooks(name: name);
    result.fold((failure) {
      emit(FailureSearchStates(failure.errMessage));
    }, (search) {
      emit(SuccessSearchStates(search));
    });
  }
}


