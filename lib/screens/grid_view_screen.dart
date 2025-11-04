import 'package:flutter/material.dart';

/// Cara pakai:
/// 1. Letakkan file ini di lib/screens/
/// 2. Tambahkan images di folder assets/images/ (lihat instruksi di bawah)
/// 3. Panggil dari main.dart: home: const GridViewScreen()
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  final List<String> _images = const [
    'assets/images/pic_1.jpeg',
    'assets/images/pic_2.jpeg',
    'assets/images/pic_3.jpeg',
    'assets/images/pic_4.jpeg',
    'assets/images/pic_5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Example')),
      body: Center(
        // Center untuk meniru android:gravity="center"
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            // physics: const BouncingScrollPhysics(), // opsional
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 90, // mirip android:columnWidth="90dp"
              mainAxisSpacing: 10, // verticalSpacing
              crossAxisSpacing: 10, // horizontalSpacing
              childAspectRatio: 1, // square items
            ),
            itemCount: _images.length,
            itemBuilder: (context, index) {
              final img = _images[index];
              return GestureDetector(
                onTap: () {
                  // contoh aksi tap: tampilkan image name
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped item ${index + 1}')),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.broken_image));
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
