import 'package:flutter/material.dart';
import 'package:flutter_application_222/models/message_model.dart';

import 'package:flutter_application_222/models/user_model.dart';
import 'package:flutter_application_222/screen/home/home_cubit/home_cubit.dart';
import 'package:flutter_application_222/screen/home/home_cubit/states.dart';
import 'package:flutter_application_222/shared/icons_broken.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChatDetails extends StatelessWidget {
  UserModel? model;
  var messageController = TextEditingController();
  ChatDetails({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      HomeCubit.get(context).getMessages(receiverId: model!.uId);
      return BlocConsumer<HomeCubit, HomeStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(model!.profileImage),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      model!.name,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18, overflow: TextOverflow.ellipsis),
                    ),
                  )
                ],
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        var message = HomeCubit.get(context).messages[index];
                        if (HomeCubit.get(context).model.uId ==
                            message.senderId) {
                          return buildMyMessage(message);
                        } else {
                          return buildMessage(message);
                        }
                      },
                      itemCount: HomeCubit.get(context).messages.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: messageController,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        )),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: MaterialButton(
                            onPressed: () {
                              HomeCubit.get(context).sendMessage(
                                  receiverId: model!.uId,
                                  dateTime: DateTime.now().toString(),
                                  messageText: messageController.text);
                            },
                            color: Colors.blue[400],
                            child: const Icon(
                              IconBroken.Send,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ])),
          );
        },
        listener: (context, state) {
          if (state is SendMessageSuccessState) {
            messageController.text = '';
          }
        },
      );
    });
  }
}

Widget buildMessage(MessageModel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 78, 73, 73),
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10),
                  bottomEnd: Radius.circular(10),
                  bottomStart: Radius.circular(10))),
          child: Text(model.messageText)),
    );
Widget buildMyMessage(MessageModel model) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10),
                  topStart: Radius.circular(10),
                  bottomStart: Radius.circular(10))),
          child: Text(model.messageText)),
    );
