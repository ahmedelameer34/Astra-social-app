import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';

import 'package:flutter_application_222/shared/icons_broken.dart';
import 'package:flutter_application_222/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: mainColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_sharp, color: mainColor))
            ],
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_sharp,
                    ),
                    label: 'Feeds'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Chat), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.User), label: 'User'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Setting), label: 'Settings')
              ]),

          /*   ConditionalBuilder(
              condition: HomeCubit.get(context).model != null,
              builder: (context) {
                var model = HomeCubit.get(context).model;
                return Column(
                  children: [
                    if (!FirebaseAuth.instance.currentUser!.emailVerified)
                      Container(
                        color: Colors.amber.withOpacity(.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: Text('Please verify your email')),
                              SizedBox(width: 20),
                              defaultTextButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification()
                                        .then((value) {
                                      showToast(
                                          msg: 'check your mail',
                                          state: toastState.SUCCSESS);
                                    }).catchError((onError) {});
                                  },
                                  text: 'Send')
                            ],
                          ),
                        ),
                      )
                  ],
                );
              },
              fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  )),*/
        );
      },
    );
  }
}
