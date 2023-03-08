import 'package:bookly_app/Features/Search/Presentation/manager/searcH_cubit/Search_Cubit.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utiles/Text.dart';

import 'Seach_List_View.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({Key? key, }) : super(key: key);

var Searchcontroller = TextEditingController();

var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child:TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                    ),
                    onFieldSubmitted: (data){
                      if(formkey.currentState!.validate()){
                        SearchCubit.get(context).search(name: data);
                      };
                    },
                    validator: (data){
                      if(data!.isEmpty){
                        return 'Please enter what you want to search for !';
                      }else{
                        return null ;

                      }
                    },
                    controller: Searchcontroller,

                   onChanged: (data){
               SearchCubit.get(context).search(name: data);


                   },

                  )

                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Search Result :',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 5,),

              ],
            ),
          ),
        ),
         SliverFillRemaining(
          child:SearchListView(),
          )

      ],
    );

  }
}

