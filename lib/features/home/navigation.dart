import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serophero/features/events/event_list.dart';
import 'package:serophero/features/home/home.dart';
import 'package:serophero/features/messages/chat_list.dart';
import 'package:serophero/features/news/news_list.dart';
import 'package:serophero/routes/generated_routes.dart';

class Navigation extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int CurrentTab = 0;
  final List<Widget> screens = [
    Home(),
    const NewsList(),
    const Event(),
    const Messages(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      appBar: CurrentTab == 0 ? buildHomeAppBar(context) : buildAppBar(),
      drawer: CurrentTab == 0 ? buildDrawer(context) : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            GeneratedRoute().onGeneratedRoute(
              const RouteSettings(arguments: '', name: '/add_news'),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.1,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomClipperDesign(),
                child: Container(
                  height: 200,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                  'assets/images/defaults/no_image_user.png')),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Text(
                                "useremail@gmail.com",
                              )
                            ],
                          ),
                          SizedBox()
                        ],
                      ),
                      SizedBox(),
                      SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: buildDrawerList()),
          ListTile(
            leading: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            title: Row(
              children: [
                Text(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'Light Mode'
                      : 'Dark Mode',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const Spacer(),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: Theme.of(context).brightness == Brightness.dark,

                    onChanged: (value) {
                      setState(() {
                        // if (value) {
                        //   Theme.of(context).setBrightness(Brightness.dark);
                        // } else {
                        //   Theme.of(context).setBrightness(Brightness.light);
                        // }
                      });
                    },
                    // activeColor: Colors.white,
                    // trackColor: Colors.purple.shade300,
                    // thumbColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  // Add logout functionality here.
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildDrawerList() {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Row(
            children: [
              const Text('View Profile'),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ViewProfilePage()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: Row(
            children: [
              const Text('Change Password'),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: Row(
            children: [
              const Text('Drop Suggestions'),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => const MakeSuggestionsPage()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(Icons.payment),
          title: Row(
            children: [
              const Text('Payments'),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const PaymentsPage()),
            // );
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: Row(
            children: [
              const Text('Help and FAQs'),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HelpPage()),
            // );
          },
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          CurrentTab == 1
              ? "Events"
              : CurrentTab == 2
                  ? "News"
                  : CurrentTab == 3
                      ? "Messages"
                      : "",
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
        padding: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        color: Colors.transparent,
        elevation: 40,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        notchMargin: 8,
        child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).colorScheme.primaryContainer),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Home();
                          CurrentTab = 0;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).colorScheme.tertiary,
                              image: CurrentTab == 0
                                  ? const AssetImage(
                                      "assets/logos/home_filled.png")
                                  : const AssetImage("assets/logos/home.png"),
                            ),
                          ]),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Event();
                          CurrentTab = 1;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).colorScheme.tertiary,
                              image: CurrentTab == 1
                                  ? const AssetImage(
                                      "assets/logos/event_filled.png")
                                  : const AssetImage("assets/logos/event.png"),
                            ),
                          ]),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const NewsList();
                          CurrentTab = 2;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).colorScheme.tertiary,
                              image: CurrentTab == 2
                                  ? const AssetImage(
                                      "assets/logos/news_filled.png")
                                  : const AssetImage("assets/logos/news.png"),
                            ),
                          ]),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Messages();
                          CurrentTab = 3;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).colorScheme.tertiary,
                              image: CurrentTab == 3
                                  ? const AssetImage(
                                      "assets/logos/chat_filled.png")
                                  : const AssetImage("assets/logos/chat.png"),
                            ),
                          ]),
                    ),
                  ],
                )
              ],
            )));
  }

  AppBar buildHomeAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image(
                    height: 22,
                    width: 22,
                    color: Theme.of(context).colorScheme.tertiary,
                    image: const AssetImage("assets/logos/menu.png"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "Hi, Shrasta",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            children: [
              Image(
                height: 28,
                width: 28,
                color: Theme.of(context).colorScheme.tertiary,
                image: const AssetImage("assets/logos/search.png"),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    GeneratedRoute().onGeneratedRoute(
                      const RouteSettings(
                        arguments: '',
                        name: '/notification',
                      ),
                    ),
                  );
                },
                child: Image(
                  height: 22,
                  width: 22,
                  color: Theme.of(context).colorScheme.tertiary,
                  image: const AssetImage("assets/logos/notification.png"),
                ),
              ),
            ],
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
    );
  }
}