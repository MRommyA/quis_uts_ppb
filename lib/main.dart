import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color(0xFF075E54))),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  int _selectedIndex = 0;

  // Daftar halaman
  final List<Widget> _pages = [
    const ChatsTab(),
    const UpdatesPage(),
    const CallsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: Color(0xFF075E54),
              padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF075E54),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Nama: M.Rommy Arianugraha',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'NIM: 5520124014',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text('Kelas: IF A 24', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              title: Text('Account'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Account')));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Privacy'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Privacy')));
              },
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        foregroundColor: Colors.white,
        title: Text('ChatApp'),
        actions: [
          IconButton(
            tooltip: 'Camera',
            icon: Icon(Icons.camera, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Open Camera')));
            },
          ),
          IconButton(
            tooltip: 'Search',
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Open Search')));
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            activeIcon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_outlined),
            activeIcon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            activeIcon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  static const List<Map<String, String>> _chats = [
    {
      'name': 'Pemrograman Piranti Bergerak',
      'msg': 'Warning!!! Deadline Task in 20 minutes.',
      'time': '10:40 PM',
    },
    {'name': 'A', 'msg': 'Liat Mobile dong', 'time': '08:15 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return ListTile(
          leading: CircleAvatar(backgroundColor: Color(0xFF075E54)),
          title: Text(chat['name']!),
          subtitle: Text(chat['msg']!),
          trailing: Text(chat['time']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatDetailScreen(contactName: chat['name']!),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String contactName;
  const ChatDetailScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        foregroundColor: Colors.white,
        title: Text(contactName),
      ),
      body: Center(
        child: Text(
          'Detail Chat',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Updates Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}

class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Calls Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }
}
