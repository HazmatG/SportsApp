import 'package:flutter/material.dart';
import 'package:untitled/models/post.dart';
import 'package:untitled/pages/FavoritesPage.dart';
import 'package:untitled/pages/MapPage.dart';
import 'package:untitled/pages/ProfilePage.dart';
import 'package:untitled/services/ApiRemote.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selind = 0;
  List<Result>? _stadiums;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    _stadiums = (await RemoteService().getPosts()) as List<Result>?;
    if (_stadiums != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void OnBeingTapped(int index) {
    setState(() {
      _selind = index;
      if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapPage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FavoritesPage()));
      } else if (index == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      phonenum: '',
                    )));
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
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Стадионы',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_outlined,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.text_rotation_down_outlined,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.redAccent,
                      ),
                      hintText: 'Найти поле...',
                      hintStyle: TextStyle(color: Colors.redAccent),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 150,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Visibility(
            visible: isLoaded,
            child: ListView.builder(
                itemCount: _stadiums?.length,
                itemBuilder: (context, index) {
                  return Column(
                    // child: _widgetopt.elementAt(_selind),
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                          child: Column(
                              children: [
                              Image.network(_stadiums![index].image),
                                Text('Спортивный комплекс "${_stadiums![index].title}"',textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, color: Colors.redAccent,size: 40,),
                                    Text(_stadiums![index].address),
                                  ],
                                )
                                ]
                            ),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
            replacement: Center(child: CircularProgressIndicator()),
          ),
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
