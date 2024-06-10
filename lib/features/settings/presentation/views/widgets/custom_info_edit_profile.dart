import 'package:fit_app/core/cache/cache_helper.dart';
import 'package:fit_app/core/utils/constsnts.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_login_button.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_text_field.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:fit_app/features/settings/presentation/cubit/settings_states.dart';
import 'package:fit_app/features/settings/presentation/views/widgets/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInfoEditProfile extends StatelessWidget {
  const CustomInfoEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SettingsCubit>();
    final name = CacheHelper().getData(key: "name");
    final phone = CacheHelper().getData(key: "phone");
    final code = CacheHelper().getData(key: "code");
    final photo = CacheHelper().getData(key: "image");
    final photoLogin = CacheHelper().getData(key: "imageLogin");


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {
          if (state is SettingsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("the information updates successfuly")));
          } else if (state is SettingsFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                  child: state is SettingsSuccess
                      ? PickImageWidget(
                          image: cubit.image,
                        )
                      : PickImageWidget(image: photo??photoLogin)),
              const SizedBox(
                height: 15,
              ),
              const Text("Your name"),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: cubit.name,
                hintText: state is SettingsSuccess? cubit.editedName :name,
                onChanged: (value) {
                  cubit.enableButton();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Phone number"),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                typing: false,
                hintText: phone,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Your code"),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                typing: false,
                hintText: code,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                    onTap: () {
                      cubit.updateInfo();
                    },
                    child: state is SettingsLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomLoginButton(
                            text: "Save",
                            isEnabled: cubit.isEnable,
                          )),
              ),
            ],
          );
        },
      ),
    );
  }
}
