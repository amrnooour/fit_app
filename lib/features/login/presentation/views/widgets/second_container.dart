import 'package:fit_app/core/utils/styles.dart';
import 'package:fit_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:fit_app/features/login/presentation/cubit/login_states.dart';
import 'package:fit_app/features/login/presentation/views/second_login_view.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_input.dart';
import 'package:fit_app/features/login/presentation/views/widgets/custom_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondContainer extends StatelessWidget {
  final double height;
  final double width;

  const SecondContainer({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        } else if (state is LoginSuccess) {
          state.loginModel.data!.isExist == true
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondLoginView(),
                  ))
              : ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid phone number")));
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
                  "Welcome back",
                  style: Styles.welcome,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "please provide your details to access your\naccount",
                  style: Styles.please,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "phone number",
                  style: Styles.phone,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomInput(
                  onChanged: (value) {
                    context.read<LoginCubit>().changeEnableButton();
                  },
                  controller: context.read<LoginCubit>().phone,
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      context.read<LoginCubit>().loginPhone();
                    },
                    child: state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomLoginButton(
                            text: "Login", isEnabled: context.read<LoginCubit>().isEnable)),
              ],
            ),
          ),
        );
      },
    );
  }
}
