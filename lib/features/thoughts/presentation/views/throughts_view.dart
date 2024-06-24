import 'package:dio/dio.dart';
import 'package:fit_app/core/api/dio_consumer.dart';
import 'package:fit_app/features/thoughts/data/repos/thoughts_repo.dart';
import 'package:fit_app/features/thoughts/presentation/cubit/thoughts_cubit.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/throught_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThroughtsView extends StatelessWidget {
  const ThroughtsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThoughtsCubit(ThoughtsRepo(DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(.1),
        appBar: AppBar(title: const Text("Thoughts"), centerTitle: true,elevation: 0,
        backgroundColor: Colors.white,),
        body: const ThroughtViewBody(),
      ),
    );
  }
}