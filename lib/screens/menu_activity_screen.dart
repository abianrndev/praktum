import 'package:flutter/material.dart';
import 'detail_activity_screen.dart';

class MenuActivityScreen extends StatelessWidget {
  const MenuActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Activity'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Action untuk settings
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Settings clicked')));
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(
            context,
            'Profil Mahasiswa',
            'Lihat informasi profil',
            Icons.person,
            Colors.blue,
            () => _navigateToDetail(context, 'Profil'),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            'Jadwal Kuliah',
            'Cek jadwal kuliah hari ini',
            Icons.schedule,
            Colors.green,
            () => _navigateToDetail(context, 'Jadwal'),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            'Nilai & IPK',
            'Lihat nilai dan IPK semester',
            Icons.grade,
            Colors.orange,
            () => _navigateToDetail(context, 'Nilai'),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            'Tugas Kuliah',
            'Daftar tugas yang harus dikerjakan',
            Icons.assignment,
            Colors.red,
            () => _navigateToDetail(context, 'Tugas'),
          ),
          const SizedBox(height: 12),
          _buildMenuCard(
            context,
            'Pengumuman',
            'Baca pengumuman kampus terbaru',
            Icons.announcement,
            Colors.purple,
            () => _navigateToDetail(context, 'Pengumuman'),
          ),
        ],
      ),
      drawer: _buildDrawerMenu(context),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDrawerMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Abian Nanda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'NIM: 2205101011',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('Grid View'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to GridViewScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_column),
            title: const Text('Linear Layout'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to LinearLayoutScreen
            },
          ),
          ListTile(
            leading: const Icon(Icons.crop_free),
            title: const Text('Relative Layout'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to RelativeLayoutScreen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Keluar'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailActivityScreen(type: type)),
    );
  }
}
