import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_providers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Theme Flutter'),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DEMO TEMA MODUL 3',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16),

            Text('Subjudul', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 16),

            Text(
              'Ini adalah contoh paragraf panjang yang menggunakan body text style.  '
              'Text ini akan mengikuti tema yang sudah didefinisikan.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 24),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Card Content',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ini konten di dalam card.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Primary Button')),
                SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Secondary Button'),
                ),
              ],
            ),

            SizedBox(height: 24),

            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan nama Anda',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
