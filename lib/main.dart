import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/googlePage.dart';
import 'package:flutter_hello/infoPage.dart';
import 'package:flutter_hello/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

const String profileNameKey = 'PROFILE_NAME';

void main() {
  _prepareAndRun();
}

Future<void> _prepareAndRun() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final profileName = prefs.getString(profileNameKey);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  return runApp(MyApp(profileName: profileName));
}

class MyApp extends StatelessWidget {
  final String? profileName;

  const MyApp({this.profileName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Login'),
      routes: {
        InfoPage.routeName: (BuildContext context) => const InfoPage(),
        MyHomePage.routeName: (BuildContext context) => const MyHomePage(
              title: 'Login',
            ),
        ProfilePage.routeName: (BuildContext context) => const ProfilePage(),
        GooglePage.routeName: (BuildContext context) => const GooglePage(),
      },
      initialRoute:
          profileName == null ? MyHomePage.routeName : ProfilePage.routeName,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/main';

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  int _counter = 0;

  Future<void> _goNext() async {
    Navigator.of(context).pushNamed(InfoPage.routeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(profileNameKey, _controller.text);
  }

  Future<void> _goGoogle() async {
    Navigator.of(context).pushNamed(GooglePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              Row(
                children: [
                  OutlinedButton(
                      onPressed: _goNext, child: Text('Registration Page')),
                  OutlinedButton(
                      onPressed: _goGoogle,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Google Auth'),
                          ),
                          Icon(Icons.account_circle),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
