import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_item_article.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListArticle extends StatelessWidget {
  const CustomListArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .6,
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is HomeLoading) {
          const Center(child: CircularProgressIndicator(color: Colors.black,));
        }
        },
        builder: (context, state) {
          return state is HomeSuccess
              ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.homeModel.data.articles.length,
                  itemBuilder: (context, index) => CustomItemArticle(
                      imageUrl: Constants.articleImage,
                      name: state.homeModel.data.articles[index].title,
                      subTitle: state.homeModel.data.articles[index].date),
                )
              : const CustomLoadingContainer();
        },
      ),
    );
  }
}
