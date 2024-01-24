import 'package:flutter/material.dart';
import 'package:newsfeed/Theme/theme.dart';
import 'package:newsfeed/router.dart';

class NewsBoard extends StatelessWidget {
  const NewsBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darktheme,
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
