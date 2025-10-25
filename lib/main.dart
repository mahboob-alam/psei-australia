import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_theme.dart';
import 'pages/home_page.dart';

void main() {
  // Remove the hash (#) from web URLs for better SEO-friendly paths
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PSEI Australia — Prince Software Engineering Institute',
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
