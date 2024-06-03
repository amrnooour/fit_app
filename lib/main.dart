import 'package:dio/dio.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/core/utils/simple_bloc_observer.dart';
import 'package:fit_app/features/home/data/repos/home_repo.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/views/home_view.dart';
import 'package:fit_app/features/login/data/repos/login_repo.dart';
import 'package:fit_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:fit_app/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var token = CacheHelper().getData(key: Constants.token);
    print(token);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginCubit(LoginRepo(dioConsumer: DioConsumer(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
              homeRepo: HomeRepo(dioConsumer: DioConsumer(dio: Dio()))),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token == null ? const LoginView() : const HomeView(),
      ),
    );
  }
}
