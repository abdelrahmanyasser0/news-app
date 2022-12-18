import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui_layer/layout_page/news_app_home.dart';
import 'package:news_app/x_shared/shared/themes.dart';
import 'bloc_layer/news_app_cubit/news_cubit.dart';
import 'bloc_layer/news_app_cubit/news_states.dart';
import 'data_layer/cashe_helper.dart';
import 'data_layer/remotly_data.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CasheHelper.init();
  String? token=CasheHelper.getAllFromShared(key: 'token');
  bool? isDark=CasheHelper.getAllFromShared(key: 'isDark');
  //علشان مشكلة ال ( null check operator used on null value)null safety
  // is dark هنا ممكن تكون null ف مينفعش ادي علامة تعجب ل ماي اب
  //بدلتها ب اتنين علامة استفهام علشان لو مش موجوده يرجع false

  runApp( MyApp(isDark!));

}

class MyApp extends StatelessWidget {

  final bool isDark;


  MyApp(this.isDark, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[

        BlocProvider(

            create: (BuildContext context)=>
            NewsAppCubit()..GetBusinessData()..GetSportsData()..GetScienceData()..isDarkTogel(returnedBool:isDark)
        ),
      ],
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          NewsAppCubit cubit=BlocProvider.of(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,

            darkTheme: darkMode,

            themeMode: cubit.isDark?ThemeMode.dark:ThemeMode.light,

            home: const NewsAppHomePage(),
          );
        }),
      ),

    );

  }
}

