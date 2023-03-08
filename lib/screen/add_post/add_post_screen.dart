import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';

import 'package:flutter_application_222/shared/components/materials.dart';

import 'package:flutter_application_222/shared/style/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        TextEditingController postController = TextEditingController();
        return Scaffold(
          appBar: AppBar(
            title: Text('New Post'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: defaultTextButton(
                    onPressed: () {
                      if (HomeCubit.get(context).postImage == null) {
                        HomeCubit.get(context).createPost(
                          dateTime: DateTime.now().toString(),
                          postText: postController.text,
                        );
                      } else {
                        HomeCubit.get(context).uploadPostImage(
                          dateTime: DateTime.now().toString(),
                          text: postController.text,
                        );
                      }
                    },
                    text: 'Post',
                    fontSize: 22,
                    textColor: mainColor),
              )
            ],
          ),
          body: Column(children: [
            if (state is PostLoadingState) LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1380&t=st=1676934299~exp=1676934899~hmac=17d2a654ee9c5a0c45bdc45bf41f0bbb23b4937005c7cc8b3f10c090db775e76'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(children: [
                          Text('Ahmed El Amir',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(height: 1.4)),
                          SizedBox(
                            width: 5,
                          ),
                        ]),
                      ]))
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "What's on your mind ?",
                      border: InputBorder.none),
                  controller: postController,
                ),
              ),
            ),
            if (HomeCubit.get(context).postImage != null)
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Image(
                        fit: BoxFit.cover,
                        image: FileImage(HomeCubit.get(context).postImage!)
                            as ImageProvider),
                  ),
                  IconButton(
                      onPressed: () {
                        HomeCubit.get(context).removeCoverImage();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 26,
                      ))
                ],
              ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: () {
                              HomeCubit.get(context).setPostImage();
                            },
                            icon: Icon(Icons.image))),
                    Expanded(
                        child: defaultTextButton(
                            onPressed: () {},
                            text: '# tags',
                            textColor: mainColor))
                  ],
                ),
              ),
            )
          ]),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
