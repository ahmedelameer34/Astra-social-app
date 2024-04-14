import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/helper/cashe_helper.dart';
import 'package:flutter_application_222/screen/home/home_screen.dart';
import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/materials.dart';
import '../../shared/style/colors.dart';
import '../register/register_screen.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: darkScaffoldColor,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/image/Ellipse 1,5.png',
                                width: 200, height: 150),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'ASTRA',
                                style:
                                    TextStyle(color: mainColor, fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Welcome back ,',
                          style: TextStyle(color: mainColor, fontSize: 25),
                        ),
                        const Text(
                          'Login to continue',
                          style: TextStyle(color: mainColor, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defTextFormField(
                            controller: emailController,
                            textType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            label: 'Email',
                            prefix: Icons.email_outlined),
                        defTextFormField(
                          onPressedsuffix: () {
                            LoginCubit.get(context).seePassword();
                          },
                          controller: passwordController,
                          isPassword: LoginCubit.get(context).seePasword,
                          textType: TextInputType.visiblePassword,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  emailAddress: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: LoginCubit.get(context).suffix,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionalBuilder(
                              condition: state is! LoginLoadingState,
                              builder: (BuildContext context) => defaultButton(
                                  onPressed: (() {
                                    if (formKey.currentState!.validate()) {
                                      LoginCubit.get(context).userLogin(
                                          emailAddress: emailController.text,
                                          password: passwordController.text);
                                    }
                                  }),
                                  text: 'LOG IN',
                                  color: Colors.white),
                              fallback: (BuildContext context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            register(
                                context: context,
                                color: mainColor,
                                widget: RegisterScreen()), //wait for build
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, state) {
          if (state is LoginErrorState) {
            showToast(msg: state.error, state: toastState.ERROR);
          }
          if (state is LoginSuccessState) {
            CasheHelper.saveData(key: 'uId', value: state.uId!);
            navigateAndFinish(context, const HomeScreen());
          }
        },
      ),
    );
  }
}
