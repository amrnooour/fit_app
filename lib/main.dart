import 'package:dio/dio.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/routes/app_router.dart';
import 'package:fit_app/core/utils/simple_bloc_observer.dart';
import 'package:fit_app/features/home/data/repos/home_repo.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/login/data/repos/login_repo.dart';
import 'package:fit_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:fit_app/features/settings/data/repos/settings_repo.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginCubit(LoginRepo(dioConsumer: DioConsumer(dio: Dio()))),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
              homeRepo: HomeRepo(dioConsumer: DioConsumer(dio: Dio()))),
        ),
        BlocProvider(create: (context) => SettingsCubit(SettingsRepo(dioConsumer: DioConsumer(dio: Dio()))),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
