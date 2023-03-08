import 'package:flutter/material.dart';
import 'package:flutter_application_222/screen/add_post/add_post_screen.dart';
import 'package:flutter_application_222/shared/components/function.dart';
import 'package:flutter_application_222/shared/icons_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1380&t=st=1676934299~exp=1676934899~hmac=17d2a654ee9c5a0c45bdc45bf41f0bbb23b4937005c7cc8b3f10c090db775e76'),
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
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.image)),
                  )
                ],
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => buildPostItem(context),
            itemCount: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  Widget buildPostItem(context) {
    return Card(
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1380&t=st=1676934299~exp=1676934899~hmac=17d2a654ee9c5a0c45bdc45bf41f0bbb23b4937005c7cc8b3f10c090db775e76'),
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
                        Text('Ahmed El Amir',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(height: 1.4)),
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
                    Text('January 21, 2023 at 5 pm',
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
            'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with',
            style: Theme.of(context).textTheme.bodyMedium,
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
          Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=1380&t=st=1676932839~exp=1676933439~hmac=ccf22243ac3c46f53b0d142e9fdbdbcc79352e1861bdeeb1aa8a0f68b315edf3'),
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
                          '1250',
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
                          ' 30 Comment',
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
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/smiley-little-boy-isolated-pink_23-2148984798.jpg?w=1380&t=st=1676934299~exp=1676934899~hmac=17d2a654ee9c5a0c45bdc45bf41f0bbb23b4937005c7cc8b3f10c090db775e76'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('write a comment ... ',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(height: 1.4)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
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
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {},
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
