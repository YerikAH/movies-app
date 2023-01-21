import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_theme.dart';
import 'screens/screens.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movies-app',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home':(context)=> const HomeScreen(),
        'details':(context)=> const DetailsScreen()
      },
      theme: AppTheme.configTheme
    );
  }
}
