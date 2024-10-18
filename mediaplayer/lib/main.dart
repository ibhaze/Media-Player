import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    Center(child: Text('Music Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Video Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Options Page', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Set background color for the entire page
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C), // Match AppBar color with the page background
        title: Text(widget.title),
        elevation: 0, // Remove shadow from AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Add horizontal padding to center the search bar
        child: Column(
          children: [
            const SizedBox(height: 0), // Further reduced space at the top to move the search bar up
            Center( // Center the search bar horizontally
              child: Container(
                width: 300, // Set a fixed width for the search bar to make it smaller
                decoration: BoxDecoration(
                  color: const Color(0xFF242424), // Set background color of the search bar
                  borderRadius: BorderRadius.circular(30.0), // Round the corners of the search bar
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '', // Removed hint text
                    border: InputBorder.none, // Remove the default border
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Adjust padding to make it smaller
                    suffixIcon: IconButton(
                      icon: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              const Color(0xFF7000FF), // Start color for the gradient
                              const Color(0xFFFF00B8), // End color for the gradient
                            ],
                          ).createShader(bounds);
                        },
                        child: const Icon(Icons.search, color: Colors.white), // Set search icon color to white for visibility
                      ),
                      onPressed: () {
                        // Add search functionality here
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Add space between the search bar and the page content
            Expanded(child: _pages[_selectedIndex]), // Display the selected page
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Options',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF7000FF), // Set selected icon color
        unselectedItemColor: Colors.white, // Set unselected icon color
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF1C1C1C), // Match the bottom navigation bar color with the page background
      ),
    );
  }
}