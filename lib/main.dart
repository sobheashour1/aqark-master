import 'package:aqark/screens/app/setting/setting_screen.dart';
import 'package:aqark/screens/data_detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aqark/screens/app/bn_screens/map_screen.dart';
import 'package:aqark/screens/images/images_screen.dart';
import 'package:aqark/widget/category_tripe_screen.dart';
import 'screens/app/bn_screens/categories_screen.dart';
import 'screens/app/main_screen.dart';
import 'screens/auth/create_account_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/app/bn_screens/map_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


   Future<void> main()  async {
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
     runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      theme:ThemeData(
        fontFamily: 'Tajawal',
        textTheme: ThemeData.light().textTheme.copyWith(

          headline5: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
          ),

          headline6: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,

          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/category_tripe_screen':(context)=>CategoryTripeScreen(),
        '/launch_screen': (context) => const LaunchScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/create_account_screen': (context) => const CreateAccountScreen(),
        '/main_screen': (context) => const MainScreen(),
        '/categories_screen': (context) => const CategoriesScreen(),
        '/map_screen': (context) => const MapsScreen(),
        '/images_screen' :(context)=>const ImagesScreen(),
        '/data_detail_screen':(context)=>const DataDetailScreen(),
        '/setting_screen':(context)=>const SettingScreen(),
      },
    );

  }
}
