import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:fit_app/features/home/presentation/cubit/home_states.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_list_item.dart';
import 'package:fit_app/features/home/presentation/views/widgets/custom_loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is HomeLoading) {
          const Center(child: CircularProgressIndicator(color: Colors.black,));
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .4,
          child: state is HomeSuccess? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.homeModel.data.sliders.length,
            itemBuilder: (context, index) =>
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomListItem(
                      imageUrl: index==0?Constants.networkImage:state.homeModel.data.sliders[index].media.url,
                      title: state.homeModel.data.sliders[index].title,
                      name: state.homeModel.data.sliders[index].name,
                      description: state.homeModel.data.sliders[index].description,
                      textButton: state.homeModel.data.sliders[index].buttonText),
                )
          ) : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomLoadingContainer(),
            ),)
        );
      },
    );
  }
}
