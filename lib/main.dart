
import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/Search_Cubit.dart';
import 'package:bookly_app/Features/Search/data/repo/repo_search.dart';
import 'package:bookly_app/Features/Search/data/repo/repo_search_imp.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utiles/Go_Router.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider(create: (context)=>    FeaturedBooksCubit(HomeRepoImpl(ApiService(Dio()),),)..fetchFeaturedBooks(),

    ),
        BlocProvider(create: (context)=> NewsetBooksCubit(HomeRepoImpl(ApiService(Dio()),),)..fetchNewestBooks(),),

BlocProvider(create: (context)=> SearchCubit(HomeRepoSearchImp(ApiService(Dio()))))
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,

        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        ),

      ),
    );
  }
}
