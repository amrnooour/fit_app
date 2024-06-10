import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/features/home/data/models/stories_details_model.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_item_success_stories.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreStoriesViewBody extends StatefulWidget {
  const SeeMoreStoriesViewBody({super.key});

  @override
  State<SeeMoreStoriesViewBody> createState() => _SeeMoreStoriesViewBodyState();
}

class _SeeMoreStoriesViewBodyState extends State<SeeMoreStoriesViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchSuccessStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return state is StoresSuccess
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.storesModel!.data.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => CustomItemSuccessStories(
                          onTap: () {
                            customNavigation(context, "/detailsStories",
                            extra: StoriesDetailsModel(
                              image: state.storesModel.data.items[index].image,
                              clientName: state.storesModel.data.items[index].clientName,
                              subTitle: state.storesModel.data.items[index].subtitle
                            ));
                          },
                          height1: height * .15,
                          imageUrl: cubit.storesModel!.data.items[index].image,
                          name: cubit.storesModel!.data.items[index].clientName,
                          subTitle:
                              cubit.storesModel!.data.items[index].subtitle),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                itemCount: 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => CustomShimmerLoading(
                    height: height * .25, width: width * .6),
              );
      },
      listener: (context, state) {},
    );
  }
}
