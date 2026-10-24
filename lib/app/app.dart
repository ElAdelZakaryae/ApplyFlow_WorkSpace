import 'package:flutter/material.dart';

import '../features/splash/presentation/pages/splash_page.dart';

class ApplyFlowApp extends StatelessWidget {
  const ApplyFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApplyFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF007AFF)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashPage(),
    );
  }
}
