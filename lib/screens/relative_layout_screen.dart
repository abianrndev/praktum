import 'package:flutter/material.dart';

class RelativeLayoutScreen extends StatefulWidget {
  const RelativeLayoutScreen({super.key});

  @override
  State<RelativeLayoutScreen> createState() => _RelativeLayoutScreenState();
}

class _RelativeLayoutScreenState extends State<RelativeLayoutScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onOk() {
    final text = _controller.text;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('OK pressed. Input: $text')));
  }

  void _onCancel() {
    _controller.clear();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Input cleared')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relative-like Layout')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // align left seperti RelativeLayout default
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: Text('Type here:', style: TextStyle(fontSize: 16.0)),
            ),

            // EditText (match_parent)
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Input disini',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Dua tombol: OK di kanan, Cancel di kiri OK (Cancel toLeftOf OK)
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // posisi grup tombol di kanan
              children: [
                TextButton(onPressed: _onCancel, child: const Text('Cancel')),
                const SizedBox(width: 10), // android:layout_marginLeft pada OK
                ElevatedButton(onPressed: _onOk, child: const Text('OK')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
