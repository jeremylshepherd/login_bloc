import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/Provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
        title: 'Log me in!!!',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
