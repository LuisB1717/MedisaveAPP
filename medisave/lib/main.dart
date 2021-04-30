/*import 'package:medisave/pages/Home.dart';
import 'package:medisave/pages/Sign_in.dart';
import 'package:flutter/material.dart';
import 'package:medisave/Services/Auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService.instance(),
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            // Rutas
          },
          debugShowCheckedModeBanner: false,
          title: 'Firebase Auth con Provider',
          home: Consumer(
            builder: (context, AuthService authService, _) {
              switch (authService.status) {
                case AuthStatus.Uninitializer:
                  return Text('Cargando');
                case AuthStatus.Authenticated:
                  return Home();
                case AuthStatus.Authenticating:
                  return SignIn();
                case AuthStatus.Unauthenticated:
                  return SignIn();
                case AuthStatus.Uninitializer:
                
                  break;
              }
              return null;
            },
          )),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:medisave/helpers/appcolor.dart';
import 'package:medisave/pages/home_2.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Medisave';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: AppColors.BACKGROUND),
        home: HomePage(),
      );
}
