import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/data/models/stories_details_model.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_item_article.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMoreArticlesViewBody extends StatefulWidget {
  const SeeMoreArticlesViewBody({super.key});

  @override
  State<SeeMoreArticlesViewBody> createState() =>
      _SeeMoreArticlesViewBodyState();
}

class _SeeMoreArticlesViewBodyState extends State<SeeMoreArticlesViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        return state is ArticlesSuccess
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => CustomItemArticle(
                          onTap: () {
                            customNavigation(context, "/detailsStories",
                                extra: StoriesDetailsModel(
                                    image: Constants.articleImage,
                                    clientName: "Amr Nour",
                                    subTitle: "flutter developer"));
                          },
                          imageUrl: Constants.articleImage,
                          name: "Amr Nour",
                          subTitle:
                              "flutter developer"),
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
