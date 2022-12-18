
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc_layer/news_app_cubit/news_cubit.dart';
import '../../bloc_layer/news_app_cubit/news_states.dart';
import '../../x_shared/shared/componants.dart';


class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list =NewsAppCubit.get(context).business;
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: ( context,index)=>BuildArticalItem(list[index],context),
            separatorBuilder: (context, index) => Container(
          width: double.infinity,
          height: 1,
          color:Colors.grey ,
          child: const Text('--'),
        ), itemCount: list.length);



      }
    );

  }
}
