
import 'package:bookly_app/Features/Search/Presentation/Widget/Search_View_Body.dart';
import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/Search_Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
