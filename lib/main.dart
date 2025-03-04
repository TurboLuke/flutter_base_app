import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/home_page.dart';
import 'package:flutter_base_app/services/data_service.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()..loadData()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter Template',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
      routes: {
        "/home": (context) => HomePage(),
      },
    );
  }
}
