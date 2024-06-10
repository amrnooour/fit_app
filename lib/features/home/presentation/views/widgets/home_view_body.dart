import 'package:fit_app/core/functions/navigations.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_column_of_text.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_list_article.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_list_success_stories.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Divider(
              color: Colors.grey.withOpacity(.5),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomListView(),
            const SizedBox(
              height: 30,
            ),
            CustomColumnOfText(
              onTap: () {
                customNavigation(context, "/seeMoreStories");
              },
              title: "Succeess Stories",
              subTitle: "SST transformations.",
            ),
            const CustomListSuccessStories(),
            const CustomColumnOfText(
                title: "Articles", subTitle: "Top SST topics."),
            const CustomListArticle(),
          ],
        ),
      ),
    );
  }
}
