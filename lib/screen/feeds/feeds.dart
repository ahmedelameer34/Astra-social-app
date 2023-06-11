import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/models/post_model.dart';
import 'package:flutter_application_222/screen/add_post/add_post_screen.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';

import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_application_222/shared/icons_broken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({super.key});
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is HomeAddCommentSuccessState) commentController.text = '';
    }, builder: (context, state) {
      var cubit = HomeCubit.get(context);

      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 60,
              child: Card(
                elevation: 4,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                NetworkImage(cubit.model.profileImage),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                          elevation: 1,
                          child: InkWell(
                              onTap: () {
                                navigateTo(context, AddPostScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("What's on your mind ?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(height: 1.4, fontSize: 18)),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            navigateTo(context, AddPostScreen());
                          },
                          icon: Icon(Icons.image)),
                    )
                  ],
                ),
              ),
            ),
            ConditionalBuilder(
                fallback: (context) {
                  return Center(
                    child: Text('no new post to see'),
                  );
                },
                condition: cubit.posts.isNotEmpty,
                builder: (context) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) =>
                        buildPostItem(context, cubit.posts[index], index),
                    itemCount: cubit.posts.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  );
                })
          ],
        ),
      );
    });
  }

  Widget buildPostItem(context, PostModel model, int index) {
    return Card(
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(model.profileImage),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(model.name,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      height: 1.4,
                                      overflow: TextOverflow.ellipsis)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(model.dateTime,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(height: 1.4)),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    size: 20,
                  ))
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Text(
            '${model.postText}',
            maxLines: 5,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 10),
            child: Container(
              width: double.infinity,
              child: Wrap(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 6),
                    child: Container(
                      height: 20,
                      child: MaterialButton(
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          '#Software',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (model.postImage != '')
            Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${model.postImage}'),
                    fit: BoxFit.cover,
                  ),
                )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          HomeCubit.get(context).likesNum[index].toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          IconBroken.Chat,
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          HomeCubit.get(context).commentsNum[index].toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 1),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              HomeCubit.get(context).model.profileImage),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextFormField(
                          onFieldSubmitted: (value) {
                            if (value != '') {
                              HomeCubit.get(context).addComment(
                                postId: HomeCubit.get(context).postIds[index],
                                name: HomeCubit.get(context).model.name,
                                uId: HomeCubit.get(context).model.uId,
                                image:
                                    HomeCubit.get(context).model.profileImage,
                                text: value,
                              );
                            }
                          },
                          controller: commentController,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  if (commentController.value.text != '') {
                                    HomeCubit.get(context).addComment(
                                      postId:
                                          HomeCubit.get(context).postIds[index],
                                      name: HomeCubit.get(context).model.name,
                                      uId: HomeCubit.get(context).model.uId,
                                      image: HomeCubit.get(context)
                                          .model
                                          .profileImage,
                                      text: commentController.value.text,
                                    );
                                  }
                                },
                              ),
                              hintText: 'write a comment ... ',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(height: 1.4)),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Share',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  HomeCubit.get(context)
                      .likePost(HomeCubit.get(context).postIds[index]);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'like',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
