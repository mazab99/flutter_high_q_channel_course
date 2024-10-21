// Drawers
// ListTile
// Divider
// Stateful widget
// SetState
// Dialog
// BottomSheet
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = 'Home';
  final List<MenuOption> _menuOptions = [
    MenuOption('Home', Icons.home),
    MenuOption('Profile', Icons.person),
    MenuOption('Settings', Icons.settings),
    MenuOption('Help', Icons.help),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Flutter Drawer'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Text('Selected: $_selectedItem', style: TextStyle(fontSize: 24)),
      ),
      bottomSheet: _buildPersistentBottomSheet(),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Mahmoud Azab'),
            accountEmail: Text('mahmoudazab@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          ..._menuOptions.map((option) {
            return ListTile(
              leading: Icon(option.icon),
              title: Text(option.title),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  _selectedItem = option.title;
                });
                Navigator.pop(context);
                if (option.title == 'Settings') {
                  _showCustomDialog(context);
                } else if (option.title == 'Help') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpScreen()),
                  );
                }
              },
            );
          }).toList(),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPersistentBottomSheet() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Persistent BottomSheet', style: TextStyle(fontSize: 16)),
          ElevatedButton(
            child: Text('More Info'),
            onPressed: () {
              _showCustomDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _userInput = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Custom Dialog'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(labelText: 'Enter something'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                _userInput = value!;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You entered: $_userInput')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class MenuOption {
  final String title;
  final IconData icon;

  MenuOption(this.title, this.icon);
}

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Screen'),
      ),
      body: Center(
        child: Text('Help content goes here.', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Text('Login form goes here.', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

