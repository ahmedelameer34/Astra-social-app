import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/add_post/add_post_screen.dart';
import 'package:flutter_application_222/screen/edit_profile/edit_profile.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';
import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_application_222/shared/components/materials.dart';
import 'package:flutter_application_222/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeGetUserLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        var userModel = HomeCubit.get(context).model;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBox(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                topRight: Radius.circular(4))),
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(userModel.profileCover)),
                      ),
                    ),
                    CircleAvatar(
                      radius: 64,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(userModel.profileImage)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(userModel.name,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    height: 1.4,
                                    overflow: TextOverflow.ellipsis)),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    userModel.bio,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text('posts',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('100',
                                  style: Theme.of(context).textTheme.bodySmall)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text('Followers',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('15.8k',
                                  style: Theme.of(context).textTheme.bodySmall)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text('Following',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('30',
                                  style: Theme.of(context).textTheme.bodySmall)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text('Photos',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text('400',
                                  style: Theme.of(context).textTheme.bodySmall)
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                      child: defaultButton(
                          onPressed: () {
                            navigateTo(context, const AddPostScreen());
                          },
                          text: 'Add Post',
                          color: Colors.white)),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: mainColor),
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            navigateTo(context, const EditProfileScreen());
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          )))
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
