import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(),lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}

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
