import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> header = ['Username', "Email", "Password"];
    List<String> subtitle = [
      'Sokchan put',
      'Sokchanxx@gmail.com',
      '................'
    ];
    final List<Icon> icon = [
      Icon(Icons.person, color: Colors.white, size: 20),
      Icon(Icons.email, color: Colors.white, size: 20),
      Icon(Icons.lock, color: Colors.white, size: 20)
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/image.png",
                    ),
                    maxRadius: 50,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Sok Chan",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "012322345",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Text(
                    "Sokchan@gmail.com",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 14,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).colorScheme.primary,
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor:
                                  Color.fromRGBO(255, 255, 255, 0.5),
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 0),
                              ),
                              tabs: [
                                Tab(text: 'PROFILE'),
                                Tab(text: 'ACTIVITIES'),
                              ],
                            ),
                          ),
                          Container(
                            height: 300, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: ListView.builder(
                                    itemCount: header.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              print(subtitle[index]);
                                            },
                                            leading: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                icon[index],
                                              ],
                                            ),
                                            title: Text(
                                              header[index],
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            subtitle: Text(
                                              subtitle[index],
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14.0),
                                            child: Divider(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withOpacity(0.3),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      'Activities',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
