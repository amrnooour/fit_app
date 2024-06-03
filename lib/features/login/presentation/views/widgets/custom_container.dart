import 'package:fit_app/core/utils/styles.dart';
import 'package:fit_app/features/home/presentation/views/home_view.dart';
import 'package:fit_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:fit_app/features/login/presentation/cubit/login_states.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_login_button.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  const CustomContainer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is CodeFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Inccorect code")));
        } else if (state is CodeSuccess) {
          state.codeModel.value == true
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ))
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Inccorect code")));
        } else if (state is CodeLoading) {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your group code",
                  style: Styles.welcome,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        "+20${context.read<LoginCubit>().phone.text} ",
                        style: Styles.please,
                      ),
                      Text(
                        "Change ?",
                        style: Styles.please.copyWith(
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter your group code",
                  style: Styles.please.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  controller: context.read<LoginCubit>().code,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().loginCode();
                    },
                    child: state is CodeLoading
                        ? const Center(child: CircularProgressIndicator())
                        : const CustomLoginButton(
                            isEnabled: true,
                            text: "Verify",
                          )),
              ],
            ),
          ),
        );
      },
    );
  }
}
