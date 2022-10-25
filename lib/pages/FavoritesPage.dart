import 'package:flutter/material.dart';
import 'package:untitled/pages/MapPage.dart';
import 'package:untitled/pages/ProfilePage.dart';
import 'package:untitled/pages/StadiumPage.dart';

void main() {
  runApp(FavoritesPage());
}

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _selind = 0;

  List<Widget> _widgetopt = <Widget>[
    Text('Index 3'),
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
      }
      else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapPage()));
      }
      else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfilePage(phonenum: '',)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Избранные',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.text_rotation_down_outlined,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: SizedBox(height: 45, child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Найти избранное...',
                    hintStyle: TextStyle(color: Colors.redAccent),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                ),)
            ],
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 150,
        ),
        body: Center(
          child: _widgetopt.elementAt(_selind),
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
}