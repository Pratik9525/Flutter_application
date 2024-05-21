import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import 'theme_provider.dart';
import 'cart_provider.dart';
import 'favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          home: LoginScreen(),
        );
      },
    );
  }
}
