import 'package:flutter/material.dart';
import 'package:messaging_app/widget/messageBox.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => ChatMember();
}

class ChatMember extends State<MyStatefulWidget> {
  final DeviceScreenType? deviceScreenType;
  const ChatMember({Key? key, this.deviceScreenType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text(
                        "Chats",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      trailing: Icon(
                        _customTileExpanded
                            ? Icons.filter_alt_outlined
                            : Icons.filter_alt_rounded,
                      ),
                      onExpansionChanged: (bool expanded) {
                        setState(() => _customTileExpanded = expanded);
                      },
                      children: [
                        Spacer(),
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                        SizedBox(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(25.0),
                                    topRight: const Radius.circular(25.0),
                                  ),
                                ),
                                child: Center(
                                  child: Text("Modal content goes here"),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Chats",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.search), onPressed: () {}),
                        SizedBox(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue.withOpacity(.1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Open",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue.withOpacity(.1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Open",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue.withOpacity(.1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Open",
                                style: TextStyle(color: Colors.blue)),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue.withOpacity(.1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Done",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: Theme.of(context).iconTheme.color!,
                                  width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Open",
                              style: TextStyle(
                                  color: Theme.of(context).iconTheme.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: List.generate(
                        members.length,
                        (index) => MemberCard(
                          member: members[index],
                          deviceScreenType: deviceScreenType,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.feedback),
              SizedBox(width: 10),
              Text(
                "Submit Feedback",
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member? member;
  final bool showJob;
  final Widget? trailing;
  final DeviceScreenType? deviceScreenType;

  const MemberCard(
      {Key? key,
      this.deviceScreenType,
      this.showJob = false,
      this.member,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          if (deviceScreenType == DeviceScreenType.mobile ||
              deviceScreenType == DeviceScreenType.tablet) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(
                    body: MessageBox(),
                    appBar: AppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      elevation: 0,
                      title: Text(
                        "Messaging",
                        style: TextStyle(color: Colors.black),
                      ),
                      iconTheme: IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            member!.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(member!.image),
            ),
          ),
        ),
        trailing: trailing ?? Text("2h"),
        subtitle: showJob ? Text(member!.job) : Text(member!.lastMessage),
      ),
    );
  }
}

class Member {
  final String image;
  final String title;
  final String lastMessage;
  final String job;

  Member(this.image, this.title, this.lastMessage, this.job);
}

List<Member> members = [
  Member(
    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    "Leslie Laurens",
    "you: UX counsoultion",
    "Freelance",
  ),
  Member(
    "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
    "Leslie Laurens",
    "you: UX counsoultion",
    "Freelance",
  ),
  Member(
      "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
      "Leslie Laurens",
      "you: UX counsoultion",
      "Product Designer"),
  Member(
    "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
    "Leslie Laurens",
    "you: UX counsoultion",
    "Freelance",
  )
];
