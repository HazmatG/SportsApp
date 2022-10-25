import 'package:flutter/material.dart';
import 'package:untitled/pages/ProfilePage.dart';
import 'package:untitled/pages/StadiumPage.dart';

void main() {
  runApp(LogInPage());
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String _phonenumber = '';

  @override
  Widget build(BuildContext context) {
    double _wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: _wid,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'stadion.kg',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Номер телефона:',
                    style: TextStyle(fontSize: 15, color: Colors.redAccent),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      _phonenumber = value;
                    },
                    maxLength: 9,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone), prefixText: '+996'))),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Войти'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  primary: Colors.redAccent),
            ),
            SizedBox(height: 10),
            TextButton(
                onPressed: _submitnoregist,
                child: Text(
                  'Продолжить без регистрации!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }

  void _submitnoregist() {
    Route route = MaterialPageRoute(builder: (context) => HomePage());      // (constructors name: class member)
    Navigator.push(context, route);
  }

  void _submit() {
    Route route = MaterialPageRoute(builder: (context) => ProfilePage(phonenum: _phonenumber,));      // (constructors name: class member)
    Navigator.push(context, route);
  }
}