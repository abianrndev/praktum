import 'package:flutter/material.dart';

class LinearLayoutScreen extends StatelessWidget {
  const LinearLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linear Layout - Merah & Hijau')),
      body: Column(
        children: [
          // Bagian yang menyerupai outer LinearLayout dengan layout_weight="2"
          Expanded(
            flex: 2,
            child: Row(
              children: [
                // Kolom Merah (layout_weight="1")
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color(0xFFAA0000), // "#aa0000"
                    alignment: Alignment.center,
                    child: const Text(
                      'Merah',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Kolom Hijau (layout_weight="1")
                Expanded(
                  flex: 1,
                  child: Container(
                    color: const Color(0xFF03FA40), // "#03fa40"
                    alignment: Alignment.center,
                    child: const Text(
                      'Hijau',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Area bawah (opsional)',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
