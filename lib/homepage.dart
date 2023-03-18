import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Following",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Followers",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              VideoDescription(),
              ActionToolBar(),
            ],
          )),
          NavigationTooLBar(),
        ],
      ),
    );
  }
}

class NavigationTooLBar extends StatelessWidget {
  static const CreateButtonWidth = 47;
  const NavigationTooLBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 70,
      color: Colors.black,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            icon: Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
            onPressed: null),
        IconButton(
            icon: Icon(
              Icons.search,
              size: 40,
              color: Colors.white,
            ),
            onPressed: null),
        buildCustomizedButton(),
        IconButton(
            icon: Icon(
              Icons.inbox,
              size: 40,
              color: Colors.white,
            ),
            onPressed: null),
        IconButton(
            icon: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
            onPressed: null)
      ]),
    );
  }

  buildCustomizedButton() {
    return Container(
        height: 30,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Stack(children: [
          Container(
              margin: EdgeInsets.only(left: 25.0),
              width: 38,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 45, 108),
                  borderRadius: BorderRadius.circular(7.0))),
          Container(
              margin: EdgeInsets.only(right: 25.0),
              width: 38,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 32, 211, 234),
                  borderRadius: BorderRadius.circular(7.0))),
          Center(
              child: Container(
            height: double.infinity,
            width: 38,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7.0)),
            child: Icon(
              Icons.add,
              size: 20.0,
            ),
          )),
        ]));
  }
}

class ActionToolBar extends StatelessWidget {
  const ActionToolBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.black,
      child: Container(
      //  margin: const EdgeInsets.only(top: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildProfilePicture(),
              buildActionToolbar(Icons.favorite_border, "2.5m"),
              buildActionToolbar(Icons.message, "1.4k"),
              buildActionToolbar(Icons.reply, ""),
              SizedBox(
                height: 20,
              ),
              buildMusicPlayer(),
            ]),
      ),
    );
  }

  buildProfilePicture() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: (60 / 2 - 50 / 2),
            child: Container(
              padding: const EdgeInsets.all(2),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: (60 / 2 - 20 / 2),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Icon(Icons.add, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  buildMusicPlayer() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Colors.grey[900],
            Colors.grey[800],
            Colors.grey[900],
            Colors.grey[800],
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl:
            "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7",
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  buildActionToolbar(IconData iconData, String text) {
    return Container(
      height: 95,
      width: 60,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          IconButton(
            icon: Icon(iconData),
            onPressed: () {},
            iconSize: 50,
            color: Colors.white,
          ),
          Text(
            "$text",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class VideoDescription extends StatelessWidget {
  const VideoDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@Johnny123",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                "Video title and some other stuffs",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  //Icon(MyFlutterApp.speech_bubble),
                  Icon(
                    Icons.music_note,
                    size: 20,
                    color: Colors.white,
                  ),
                  Text(
                    "currently playing song",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
