import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_shimmer_loading.dart';
import 'package:fit_app/features/thoughts/presentation/cubit/thoughts_cubit.dart';
import 'package:fit_app/features/thoughts/presentation/cubit/thoughts_states.dart';
import 'package:fit_app/features/thoughts/presentation/views/widgets/custom_item_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThroughtViewBody extends StatefulWidget {
  const ThroughtViewBody({super.key});

  @override
  State<ThroughtViewBody> createState() => _ThroughtViewBodyState();
}

class _ThroughtViewBodyState extends State<ThroughtViewBody> {
  @override
  void initState() {
    context.read<ThoughtsCubit>().getMedia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThoughtsCubit>();
    return BlocConsumer<ThoughtsCubit, ThoughtsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is ThoughtsSuccess
            ? ListView.builder(
                itemCount: cubit.thoughtsModel!.data.items.length,
                itemBuilder: (context, index) => cubit
                            .thoughtsModel?.data.items[index].media.url ==
                        ""
                    ? CustomItemPost(
                        title: cubit.thoughtsModel!.data.items[index].content,
                        name: cubit.thoughtsModel!.data.items[index].user.name,
                        profileImage:
                            cubit.thoughtsModel!.data.items[index].user.image,
                        weeks: cubit.thoughtsModel!.data.items[index].date,
                      )
                    : CustomItemPost(
                        onTap: () {
                          customNavigation(context, "/imageDetails",
                              extra: cubit
                                  .thoughtsModel?.data.items[index].media.url);
                        },
                        title: cubit.thoughtsModel!.data.items[index].content,
                        name: cubit.thoughtsModel!.data.items[index].user.name,
                        profileImage:
                            cubit.thoughtsModel!.data.items[index].user.image,
                        weeks: cubit.thoughtsModel!.data.items[index].date,
                        imageUrl:
                            cubit.thoughtsModel?.data.items[index].media.url,
                        /*videoUrl:
                      cubit.thoughtsModel!.data.items[index].media.thumbnail,*/
                      ),
              )
            : ListView.builder(
                itemBuilder: (context, index) => const CustomShimmerLoading(
                    height: 250, width: double.infinity),
              );
      },
    );
  }
}
