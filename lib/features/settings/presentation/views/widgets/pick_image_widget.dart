import 'dart:io';
import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_states.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/custom_circular_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  final String image;
  const PickImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 130,
          height: 130,
          child: context.read<SettingsCubit>().profilePic == null
              ? CustomCircularAvatar(
                backgroundImage: NetworkImage(image),
                onTap: (){
                  ImagePicker().pickImage(source: ImageSource.gallery)
                  .then((value) => context.read<SettingsCubit>().uploadProfileImage(value!));
                },
              ): CustomCircularAvatar(
                backgroundImage: FileImage(File(context.read<SettingsCubit>().profilePic!.path)),
                onTap: (){
                  ImagePicker().pickImage(source: ImageSource.gallery)
                  .then((value) => context.read<SettingsCubit>().uploadProfileImage(value!));
                },
              )
        );
      },
    );
  }
}
