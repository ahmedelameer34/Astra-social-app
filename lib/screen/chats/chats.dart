import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_222/models/user_model.dart';
import 'package:flutter_application_222/screen/chats/chat_screen.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';
import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          builder: (BuildContext context) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildChatItem(context, HomeCubit.get(context).users[index]),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                    ),
                itemCount: HomeCubit.get(context).users.length);
          },
          condition: HomeCubit.get(context).users.isNotEmpty,
          fallback: (BuildContext context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildChatItem(context, UserModel model) => InkWell(
        onTap: () {
          navigateTo(
              context,
              ChatDetails(
                model: model,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(model.profileImage),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 250,
              child: Text(model.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        height: 1.4,
                        overflow: TextOverflow.ellipsis,
                      )),
            ),
          ]),
        ),
      );
}
