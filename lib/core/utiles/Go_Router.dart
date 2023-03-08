
import 'package:bookly_app/Features/Search/Presentation/Search_view.dart';
import 'package:bookly_app/Features/Splash/presentation/view/Splash_view.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../../Features/home/presentation/manger/smila_books_cubit/similar_books_cubit.dart';

abstract class AppRouter{
static const KHomeview = '/homeView';
static const KBookPage = '/BookDetailes';
static const KSearchview = '/SearchView';


 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Splash_view(),
      ),
   GoRoute(path: KHomeview,
   builder: (context ,state)=>  HomeView(),
   ),
      GoRoute(
        path: KBookPage,
        builder: (context ,state)=>   BlocProvider(

            create: (context)=> SimilarBooksCubit(HomeRepoImpl (ApiService(Dio()))),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: KSearchview,
        builder: (context ,state)=>  const SearchView(),
      )


    ],
  );


}