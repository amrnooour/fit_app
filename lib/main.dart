import 'package:dio/dio.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/core/utils/simple_bloc_observer.dart';
import 'package:fit_app/features/login/data/repos/login_repo.dart';
import 'package:fit_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:fit_app/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepo(dioConsumer: DioConsumer(dio: Dio()))),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
