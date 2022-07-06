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

  // await signInWithGoogle();

  return runApp(MyApp(profileName: profileName));
}


// Future<UserCredential> signInWithGoogle() async {

// //   GoogleSignIn _googleSignIn = GoogleSignIn(
// //   scopes: [
// //     'email',
// //     'https://www.googleapis.com/auth/contacts.readonly',
// //   ],
// // );



//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

class MyApp extends StatelessWidget {
  final String? profileName;

  const MyApp({this.profileName, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'initialPage'),
      routes: {
        InfoPage.routeName: (BuildContext context) => const InfoPage(),
        MyHomePage.routeName: (BuildContext context) => const MyHomePage(
              title: 'initialPage',
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: 'text',
                child: const Text(
                  'Nasyka deneg podnimem budet kaif',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: TextField(
                controller: _controller,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goNext,
        tooltip: 'Increment',
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
