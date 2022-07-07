import 'package:flutter/material.dart';
import 'package:flutter_hello/googlePage.dart';
import 'package:flutter_hello/main.dart';
import 'package:flutter_hello/profilePage.dart';

class InfoPage extends StatefulWidget {
  static const routeName = '/info';

  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  void _goPrev() {
    Navigator.pop(context);
  }

  void _goNext() {
    Navigator.of(context).pushNamed(GooglePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // the App.build method, and use it to set our appbar title.
        title: Text('Registration Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 20,
                decoration: InputDecoration(
                  // icon: Icon(Icons.favorite),
                  labelText: 'Login',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  // helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 20,
                decoration: InputDecoration(
                  // icon: Icon(Icons.favorite),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  // helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 20,
                decoration: InputDecoration(
                  // icon: Icon(Icons.favorite),
                  labelText: 'Repeat Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                  // helperText: 'Helper text',
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6200EE)),
                  ),
                ),
              ),
              OutlinedButton(onPressed: _goPrev, child: Text('Login Page'))
            ],
          ),
        ),
      ),
    );
  }
}
