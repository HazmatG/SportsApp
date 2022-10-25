import 'package:flutter/material.dart';
import 'package:untitled/pages/FavoritesPage.dart';
import 'package:untitled/pages/LogInPage.dart';
import 'package:untitled/pages/MapPage.dart';
import 'package:untitled/pages/StadiumPage.dart';

class ProfilePage extends StatefulWidget {
  final String phonenum;
  const ProfilePage({Key? key, required this.phonenum}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selind = 0;

  List<Widget> _widgetopt = <Widget>[
    Text('Index 4'),
    Text('Index 2'),
    Text('Index 3'),
    Text('Index 4'),
  ];


  void OnBeingTapped(int index) {
    setState(() {
      _selind = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapPage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FavoritesPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[50],
        appBar: AppBar(
          title: Text('Профиль', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/ava.jpg'),
                    maxRadius: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Неизвестный\nпользователь',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('+996' + widget.phonenum,
                      style: TextStyle(color: Colors.redAccent, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5,
                              offset: Offset(
                                1.5, // horizontal, move right 10
                                1.5, // vertical, move down 10
                              ),
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(color: Colors.white70),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Пользовательское соглашение',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.black,
                                  )
                                ]),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Пригласить друзей',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: _return,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Выйти',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.black,
                  ),
                  label: ''),
            ],
            currentIndex: _selind,
            selectedItemColor: Colors.yellow,
            onTap: OnBeingTapped,
          ),
        ),
      ),
      title: 'Stadium',
    );
  }

  void _return() {
      Route route = MaterialPageRoute(builder: (context) => LogInPage());      // (constructors name: class member)
      Navigator.push(context, route);
  }
}
