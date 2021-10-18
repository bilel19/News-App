
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/news_app/search/search_screen.dart';

import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Hola News'),
              actions: [
                IconButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                  },
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    cubit.changeAppMode();
                  },
                  icon: Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            body: cubit.screens[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.BottomItems,
            ),
          );
        },
      );
  }
}
