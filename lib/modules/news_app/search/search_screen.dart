import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var SearchController = TextEditingController();
    return BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state){},
       builder: (context,state){
         var list=NewsCubit.get(context).search;
         return Scaffold(
           appBar: AppBar(),
           body: Column(
             children: [
               Padding(
                 padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                 child: defaulttextfield(
                     controller: SearchController,
                     type: TextInputType.text,
                     onChange: (v){
                       NewsCubit.get(context).getSearch(v);
                     },
                     validate: (String value){
                       if(value.isEmpty) {
                         return 'search cannot be empty';
                       }
                       return null;
                     },
                     label: 'SEARCH',
                     prefix: Icons.search,
                 ),
               ),
               Expanded(child: BuildArticles(list, context,isSearch: true)),
             ],
           ),
         );
      },
    );
  }
}
