import 'package:flutter/material.dart';
import 'screens/grid_view_screen.dart';
import 'screens/linear_layout_screen.dart';
import 'screens/relative_layout_screen.dart';
import 'screens/menu_activity_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const MenuActivityScreen(),

      // Definisikan routes untuk navigasi
      routes: {
        '/menu': (context) => const MenuActivityScreen(),
        '/grid': (context) => const GridViewScreen(),
        '/linear': (context) => const LinearLayoutScreen(),
        '/relative': (context) => const RelativeLayoutScreen(),
      },
    );
  }
}
