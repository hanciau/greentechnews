import 'package:flutter/material.dart';
import 'login.dart';
import 'PopularNewsPage.dart';
import 'apresiasi.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: appTitle), // Set the initial page
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of images for carousel slider
  final List<String> carouselImages = [
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200',
  ];

  // List of images for grid view
  final List<String> gridImages = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/150',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Navbar color
        title: const Text('GreenTechNews'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person), // Icon orang di sisi kanan
            onPressed: () {
              // Aksi yang dilakukan ketika ikon ditekan
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text "Hot News" above the carousel slider
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hot News',
                style: TextStyle(
                  color: const Color.fromARGB(255, 20, 4, 3),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Carousel Slider (PageView)
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                itemCount: carouselImages.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    carouselImages[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),

            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: gridImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Image.network(gridImages[index]);
                },
              ),
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
                color: Colors.lightBlue, // Warna latar belakang biru muda
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
              child: ListTile(
                title: const Text('Home'),
                onTap: () {
                  _onItemTapped(1);
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
                    _selectedIndex == 1 ? Colors.lightBlue : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0), // Sudut membulat
                border: Border.all(
                  color: _selectedIndex == 1
                      ? Colors.lightBlue
                      : Colors.transparent,
                  width: 1.0, // Lebar garis border
                ),
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
              child: ListTile(
                title: const Text('Berita Popular'),
                selected: _selectedIndex == 1,
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
                border: Border.all(
                  color: _selectedIndex == 2
                      ? Colors.lightBlue
                      : Colors.transparent,
                  width: 1.0, // Lebar garis border
                ),
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
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
                border: Border.all(
                  color: _selectedIndex == 3
                      ? Colors.lightBlue
                      : Colors.transparent,
                  width: 1.0, // Lebar garis border
                ),
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
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
                border: Border.all(
                  color: _selectedIndex == 4
                      ? Colors.lightBlue
                      : Colors.transparent,
                  width: 1.0, // Lebar garis border
                ),
              ),
              margin: const EdgeInsets.symmetric(
                  vertical: 4.0), // Jarak vertikal antar item
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
