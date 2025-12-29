import 'package:flutter/material.dart';

class DetailActivityScreen extends StatelessWidget {
  final String type;

  const DetailActivityScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail $type'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 20),
            _buildContentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    IconData icon = _getIconForType();
    Color color = _getColorForType();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _getDescriptionForType(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentList() {
    List<Map<String, String>> items = _getContentForType();

    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(item['title'] ?? ''),
              subtitle: Text(item['subtitle'] ?? ''),
              trailing: Text(
                item['value'] ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _getIconForType() {
    switch (type) {
      case 'Profil':
        return Icons.person;
      case 'Jadwal':
        return Icons.schedule;
      case 'Nilai':
        return Icons.grade;
      case 'Tugas':
        return Icons.assignment;
      case 'Pengumuman':
        return Icons.announcement;
      default:
        return Icons.info;
    }
  }

  Color _getColorForType() {
    switch (type) {
      case 'Profil':
        return Colors.blue;
      case 'Jadwal':
        return Colors.green;
      case 'Nilai':
        return Colors.orange;
      case 'Tugas':
        return Colors.red;
      case 'Pengumuman':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _getDescriptionForType() {
    switch (type) {
      case 'Profil':
        return 'Informasi lengkap profil mahasiswa';
      case 'Jadwal':
        return 'Jadwal kuliah semester ini';
      case 'Nilai':
        return 'Hasil nilai dan IPK';
      case 'Tugas':
        return 'Daftar tugas kuliah';
      case 'Pengumuman':
        return 'Pengumuman terbaru kampus';
      default:
        return 'Detail informasi';
    }
  }

  List<Map<String, String>> _getContentForType() {
    switch (type) {
      case 'Profil':
        return [
          {'title': 'Nama', 'subtitle': 'Nama lengkap', 'value': 'Abian Nanda'},
          {
            'title': 'NIM',
            'subtitle': 'Nomor Induk Mahasiswa',
            'value': '2205101011',
          },
          {
            'title': 'Program Studi',
            'subtitle': 'Jurusan',
            'value': 'Teknik Informatika',
          },
          {'title': 'Semester', 'subtitle': 'Semester aktif', 'value': '5'},
          {'title': 'Status', 'subtitle': 'Status mahasiswa', 'value': 'Aktif'},
        ];
      case 'Jadwal':
        return [
          {
            'title': 'Pemrograman Bergerak',
            'subtitle': 'Senin, 08:00-10:00',
            'value': 'Lab B',
          },
          {
            'title': 'Basis Data',
            'subtitle': 'Selasa, 10:00-12:00',
            'value': 'A201',
          },
          {
            'title': 'Algoritma',
            'subtitle': 'Rabu, 13:00-15:00',
            'value': 'A301',
          },
          {
            'title': 'Web Programming',
            'subtitle': 'Kamis, 08:00-10:00',
            'value': 'Lab A',
          },
          {
            'title': 'Matematika Diskrit',
            'subtitle': 'Jumat, 09:00-11:00',
            'value': 'A105',
          },
        ];
      case 'Nilai':
        return [
          {
            'title': 'Pemrograman Bergerak',
            'subtitle': 'Semester 5',
            'value': 'A',
          },
          {'title': 'Basis Data', 'subtitle': 'Semester 5', 'value': 'A-'},
          {'title': 'Algoritma', 'subtitle': 'Semester 4', 'value': 'B+'},
          {'title': 'Web Programming', 'subtitle': 'Semester 4', 'value': 'A'},
          {
            'title': 'IPK Kumulatif',
            'subtitle': 'Sampai semester 5',
            'value': '3.75',
          },
        ];
      case 'Tugas':
        return [
          {
            'title': 'Project Flutter',
            'subtitle': 'Pemrograman Bergerak',
            'value': 'Deadline: 31 Des',
          },
          {
            'title': 'Database Design',
            'subtitle': 'Basis Data',
            'value': 'Deadline: 28 Des',
          },
          {
            'title': 'Algorithm Analysis',
            'subtitle': 'Algoritma',
            'value': 'Deadline: 30 Des',
          },
          {
            'title': 'Web Portfolio',
            'subtitle': 'Web Programming',
            'value': 'Deadline: 2 Jan',
          },
        ];
      case 'Pengumuman':
        return [
          {
            'title': 'Libur Natal',
            'subtitle': '25 Desember 2024',
            'value': 'Penting',
          },
          {
            'title': 'UAS Semester Ganjil',
            'subtitle': '6-20 Januari 2025',
            'value': 'Akademik',
          },
          {
            'title': 'Pendaftaran KRS',
            'subtitle': '15-30 Januari 2025',
            'value': 'Akademik',
          },
          {
            'title': 'Workshop Flutter',
            'subtitle': '10 Januari 2025',
            'value': 'Event',
          },
        ];
      default:
        return [];
    }
  }
}
