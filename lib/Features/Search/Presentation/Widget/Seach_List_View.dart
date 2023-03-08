


import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/Search_Cubit.dart';
import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/search_state.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utiles/Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchListView extends StatelessWidget {
  const SearchListView({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchStates>(
      builder: (context,state){
        if(state is SuccessSearchStates){
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(

              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.book.length,

                  itemBuilder: (context, index) =>  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: BookListViewItem(bookModel: state.book[index],),
                    ),
                  ),
            ),
          );
        }else if(state is FailureSearchStates){
          return Center(child: const Text('Not Found any thing, please try again',style: Styles.textStyle20,));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
