import 'package:flutter/material.dart';
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
    Navigator.of(context).pushNamed(ProfilePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Info Page'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'text',
                child: const Text(
                  'Nasyka deneg podnimem budet kaif',
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            OutlinedButton(child: Text('profile'), onPressed: _goNext),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text('SOMEText'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goPrev,
        tooltip: 'Increment',
        child: const Icon(Icons.preview),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
