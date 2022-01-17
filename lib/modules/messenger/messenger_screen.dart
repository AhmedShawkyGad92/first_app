// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 20.0,
          title: Row(
            children: const [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1641004758882-462b11e83d96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              SizedBox(
                width: 13.0,
              ),
              Text(
                'Chats',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  )),
            ),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        // BODY------------

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    color: Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Search',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildStoryItem();
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.0,
                    ),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15.0,
                        ),
                    itemCount: 20),
              ],
            ),
          ),
        ));
  }

  Widget buildChatItem() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1641004758882-462b11e83d96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            ),
            CircleAvatar(
              radius: 9.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Shawky',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'hello my name is ahmed shawky',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                  Text(
                    '01:19 am',
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStoryItem() {
    return Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1641004758882-462b11e83d96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              CircleAvatar(
                radius: 9.0,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Mohamed Shawky Abdelrahman',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
