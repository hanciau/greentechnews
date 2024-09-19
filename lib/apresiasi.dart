import 'package:flutter/material.dart';
import 'login.dart';
import 'main.dart';
import 'PopularNewsPage.dart';

class apresiasi extends StatefulWidget {
  const apresiasi({super.key});

  @override
  State<apresiasi> createState() => _apresiasiState();
}

class _apresiasiState extends State<apresiasi> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('GreenTechNews'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(10.0),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bagian apresiasi dengan QR code dan tombol
            Text(
              'Apresiasi untuk kami',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://via.placeholder.com/150', // Ganti dengan URL QR code jika ada
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Klik disini'),
            ),
            SizedBox(height: 30),
            Text(
              'Apresiasi untuk penulis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Bagian penulis
            Expanded(
              child: ListView(
                children: [
                  PenulisTile(nama: 'Mulyono'),
                  PenulisTile(nama: 'Suparman'),
                  PenulisTile(nama: 'Denis'),
                  PenulisTile(nama: 'Josgan'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Tulisan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              margin: EdgeInsets.zero,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'GreenTechNews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
             Container(
              decoration: BoxDecoration(
                color:
                    _selectedIndex == 0 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: const Text('Home'),
                onTap: () {
                  _onItemTapped(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyApp()),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    _selectedIndex == 2 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: const Text('Riwayat'),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PopularNewsPage()),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue, // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
              child: ListTile(
                title: const Text('Berita Popular'),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const apresiasi()),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    _selectedIndex == 3 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: const Text('Riwayat'),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    _selectedIndex == 4 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: const Text('Penanda'),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String title,
    required int index,
    required BuildContext context,
    required Widget destination,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.lightBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title),
        selected: _selectedIndex == index,
        onTap: () {
          _onItemTapped(index);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}

class PenulisTile extends StatelessWidget {
  final String nama;

  const PenulisTile({required this.nama});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(nama),
      ),
    );
  }
}
