import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_layer/news_app_cubit/news_cubit.dart';
import '../../bloc_layer/news_app_cubit/news_states.dart';
import '../../x_shared/shared/componants.dart';
class Search extends StatelessWidget {

  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsAppCubit.get(context).search;
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Expanded(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value){
                    NewsAppCubit.get(context).GetSearchData(value);
                  },

                  validator: (value) {
                    if (value!.isEmpty) {
                      print('entre search');
                    } else {
                      return null;
                    }
                  },
                  controller: searchController,
                  decoration:const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'search',
                    border:OutlineInputBorder(),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ( context,index)=>BuildArticalItem(list[index],context),
                        separatorBuilder: (context, index) => Container(
                          width: double.infinity,
                          height: 1,
                          color:Colors.grey ,
                          child: const Text('--'),
                        ), itemCount: list.length),
                  ),
                )
              

              ],
            ),
          ),
        ),
      );
      });



  }
}
