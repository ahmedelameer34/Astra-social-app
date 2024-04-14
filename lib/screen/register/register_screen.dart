// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/home/home_screen.dart';
import 'package:flutter_application_222/screen/register/register_cubit/register_cubit.dart';
import 'package:flutter_application_222/screen/register/register_cubit/states.dart';
import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/materials.dart';
import '../../shared/style/colors.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
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
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset('assets/image/Ellipse 1,5.png',
                                  width: 100, height: 70),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'ASTRA',
                                  style:
                                      TextStyle(color: mainColor, fontSize: 25),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          'Hello ,',
                          style: TextStyle(color: mainColor, fontSize: 25),
                        ),
                        const Text(
                          'Register now and meet Your friends',
                          style: TextStyle(color: mainColor, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defTextFormField(
                            controller: nameController,
                            textType: TextInputType.name,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            label: 'Your Name',
                            prefix: Icons.person),
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
                            RegisterCubit.get(context).seePassword();
                          },
                          controller: passwordController,
                          isPassword: RegisterCubit.get(context).seePasword,
                          textType: TextInputType.visiblePassword,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  password: passwordController.text,
                                  emailAddress: emailController.text,
                                  phone: phoneController.text);
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
                          suffix: RegisterCubit.get(context).suffix,
                        ),
                        defTextFormField(
                            controller: phoneController,
                            textType: TextInputType.phone,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your Phone number';
                              }
                              return null;
                            },
                            label: 'Phone',
                            prefix: Icons.phone),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (BuildContext context) => defaultButton(
                                  onPressed: (() {
                                    if (formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          password: passwordController.text,
                                          emailAddress: emailController.text,
                                          phone: phoneController.text);
                                    }
                                  }),
                                  text: 'REGISTER',
                                  color: Colors.white),
                              fallback: (BuildContext context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            login(
                                context: context,
                                color: mainColor,
                                widget: LoginScreen()), //wait for build
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
          if (state is CreateUserSuccessState) {
            navigateAndFinish(context, const HomeScreen());
          }
          if (state is CreateUserErrorState) {
            showToast(msg: state.error, state: toastState.ERROR);
          }
        },
      ),
    );
  }
}
