import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/data/models/stories_details_model.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_item_success_stories.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListSuccessStories extends StatelessWidget {
  const CustomListSuccessStories({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height * .4,
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is StoresFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is HomeLoading) {
            const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
        },
        builder: (context, state) {
          return state is HomeSuccess
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.homeModel!.data.successStories.length,
                  itemBuilder: (context, index) => CustomItemSuccessStories(
                      onTap: () {
                        customNavigation(
                          context,
                          "/detailsStories",
                          extra: StoriesDetailsModel(
                            image: Constants.networkImage1,
                             clientName: cubit.homeModel!.data.successStories[index].clientName,
                              subTitle: cubit.homeModel!.data.successStories[index].subtitle)
                        );
                      },
                      imageUrl: Constants.networkImage1,
                      name: cubit
                          .homeModel!.data.successStories[index].clientName,
                      subTitle:
                          cubit.homeModel!.data.successStories[index].subtitle),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomShimmerLoading(
                        width: width * .6, height: height * .25),
                  ),
                );
        },
      ),
    );
  }
}
