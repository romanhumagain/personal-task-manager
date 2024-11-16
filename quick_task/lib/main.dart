import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_task/pages/splash_screen.dart';
import 'package:quick_task/provider/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.getMode
              ? themeProvider.themeData
              : themeProvider.themeData,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
