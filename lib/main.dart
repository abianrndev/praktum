import 'package:flutter/material.dart';
import 'screens/grid_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'praktikum1',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Ubah home: ke screen yang ingin Anda lihat.
      // Untuk layout Merah/Hijau gunakan LinearLayoutScreen()
      // Untuk layout Relative-like gunakan RelativeLayoutScreen()
      // home: const LinearLayoutScreen(),
      home: const GridViewScreen(),
      // home: const RelativeLayoutScreen(),
    );
  }
}
