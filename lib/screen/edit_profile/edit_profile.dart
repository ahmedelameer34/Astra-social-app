import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';

import 'package:flutter_application_222/shared/components/materials.dart';
import 'package:flutter_application_222/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeGetUserLoadingState) {
        Center(
          child: CircularProgressIndicator(),
        );
      }
    }, builder: (context, state) {
      var userModel = HomeCubit.get(context).model;
      var profileImage = HomeCubit.get(context).profileImage;
      var coverImage = HomeCubit.get(context).coverImage;
      nameController.text = userModel.name;
      bioController.text = userModel.bio;
      phoneController.text = userModel.phone;

      return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              defaultTextButton(
                  onPressed: () {
                    HomeCubit.get(context).updateUserInfo(
                        name: nameController.text,
                        bio: bioController.text,
                        phone: phoneController.text);
                  },
                  text: 'Save',
                  fontSize: 17,
                  textColor: mainColor)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              if (state is UpdatePofileLoadingState)
                const LinearProgressIndicator(
                  color: mainColor,
                ),
              Container(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4))),
                            child: Image(
                                fit: BoxFit.cover,
                                image: coverImage == null
                                    ? NetworkImage('${userModel.profileCover}')
                                    : FileImage(coverImage) as ImageProvider),
                          ),
                          IconButton(
                              onPressed: () {
                                HomeCubit.get(context).setCoverImage();
                              },
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                size: 26,
                              ))
                        ],
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 64,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Center(
                            child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(userModel.profileImage)
                                    : FileImage(profileImage) as ImageProvider),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              HomeCubit.get(context).setProfileImage();
                            },
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              size: 28,
                            ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (HomeCubit.get(context).profileImage != null ||
                  HomeCubit.get(context).coverImage != null)
                Row(
                  children: [
                    if (HomeCubit.get(context).profileImage != null)
                      Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                                onPressed: () {
                                  HomeCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text);
                                },
                                text: 'Upload Profile',
                                color: Colors.white),
                            if (state is UploadPofileImageLoadingState)
                              LinearProgressIndicator(
                                color: mainColor,
                              )
                          ],
                        ),
                      ),
                    SizedBox(
                      width: 5,
                    ),
                    if (HomeCubit.get(context).coverImage != null)
                      Expanded(
                        child: Column(
                          children: [
                            defaultButton(
                                onPressed: () {
                                  HomeCubit.get(context).uploadcoverImage(
                                      name: nameController.text,
                                      bio: bioController.text,
                                      phone: phoneController.text);
                                },
                                text: 'Upload Cover',
                                color: Colors.white),
                            if (state is UploadCoverImageLoadingState)
                              LinearProgressIndicator(
                                color: mainColor,
                              )
                          ],
                        ),
                      )
                  ],
                ),
              if (HomeCubit.get(context).profileImage != null ||
                  HomeCubit.get(context).coverImage != null)
                SizedBox(
                  height: 10,
                ),
              defTextFormField(
                  controller: nameController,
                  textType: TextInputType.name,
                  validate: (name) {
                    if (name.isEmpty) {
                      return "Name must not be empty";
                    }
                  },
                  label: 'Edit your name',
                  prefix: Icons.person_outlined),
              SizedBox(
                height: 10,
              ),
              defTextFormField(
                  controller: bioController,
                  textType: TextInputType.name,
                  validate: (bio) {
                    if (bio.isEmpty) {
                      return "bio must not be empty";
                    }
                  },
                  label: 'Edit your bio',
                  prefix: Icons.info),
              defTextFormField(
                  controller: phoneController,
                  textType: TextInputType.phone,
                  validate: (name) {
                    if (name.isEmpty) {
                      return "phone must not be empty";
                    }
                  },
                  label: 'Edit your Phone number',
                  prefix: Icons.phone_android),
              SizedBox(
                height: 10,
              ),
            ]),
          ));
    });
  }
}
