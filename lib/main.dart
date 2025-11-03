import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_theme.dart';
import 'pages/home_page.dart';
import 'pages/services_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/portfolio_page.dart';
import 'widgets/app_scaffold.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => AppScaffold(child: const HomePage()),
        '/services': (context) => AppScaffold(child: const ServicesPage()),
        '/about': (context) => AppScaffold(child: const AboutPage()),
        '/contact': (context) => AppScaffold(child: const ContactPage()),
        '/portfolio': (context) => AppScaffold(child: const PortfolioPage()),
      },
    );
  }
}