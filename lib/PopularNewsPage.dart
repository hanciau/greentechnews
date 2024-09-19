import 'package:flutter/material.dart';
import 'login.dart';
import 'main.dart';
import 'apresiasi.dart';
class PopularNewsPage extends StatefulWidget {
  const PopularNewsPage({super.key});

  @override
  State<PopularNewsPage> createState() => _PopularNewsPageState();
}

class _PopularNewsPageState extends State<PopularNewsPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> popularNewsImages = [
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
      'https://via.placeholder.com/400x500',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Navbar color
        title: const Text('GreenTechNews'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // Icon orang di sisi kanan
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Login()), // Navigasi ke halaman login
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            color: Colors.green, // Background color for search bar
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
      body: ListView.builder(
        itemCount: popularNewsImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Image.network(
              popularNewsImages[index],
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
          );
        },
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
                color: Colors.lightBlue, // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
              child: ListTile(
                title: const Text('Berita Popular'),
                onTap: () {
                  _onItemTapped(1);
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
                color:
                    _selectedIndex == 2 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: const Text('Apresiasi'),
                selected: _selectedIndex == 2,
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
}
