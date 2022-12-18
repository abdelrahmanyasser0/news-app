import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_layer/news_app_cubit/news_cubit.dart';
import '../../bloc_layer/news_app_cubit/news_states.dart';
import '../news_app_modules/search.dart';

class NewsAppHomePage extends StatelessWidget {
  const NewsAppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsAppCubit cubit =BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(

            title: const Text('NewsApp'),
            actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                  },
                  icon: const Icon(CupertinoIcons.search),
                ),
              IconButton(
                onPressed: () {

                  cubit.isDarkTogel();
                  cubit.emit(ThemModeState());
                },
                icon: const Icon(CupertinoIcons.brightness_solid),
              ),

            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.navBar(index);
            },
          ),
        );

      }
      );

  }
}
