import 'package:flutter/material.dart';
import 'package:untitled/pages/FavoritesPage.dart';
import 'package:untitled/pages/ProfilePage.dart';
import 'package:untitled/pages/StadiumPage.dart';

void main() {
  runApp(MapPage());
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selind = 0;

  List<Widget> _widgetopt = <Widget>[
    Text('Index 2'),
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
      else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FavoritesPage()));
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
          title: Text('Карта', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: Center(
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