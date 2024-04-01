import 'package:flutter/material.dart';
import 'package:mahmoud/screens/search_in_drop_down.dart';
import 'package:quick_actions/quick_actions.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: SearchInDropDown(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  QuickActions quickActions = const QuickActions();

  void showItems() {
    quickActions.setShortcutItems(
      [
        const ShortcutItem(
          type: 'notification',
          localizedTitle: 'Notification Screen',
          icon: 'notification',
        ),
        const ShortcutItem(
          type: 'fav',
          localizedTitle: 'Favourites Screen',
          icon: 'wishlist',
        ),
      ],
    );
  }

  void handleNavigation() {
    quickActions.initialize(
      (String type) {
        switch (type) {
          case 'notification':
            navigate(const NotificationScreen());
            break;
          case 'fav':
            navigate(const FavScreen());
            break;
        }
      },
    );
  }

  navigate(Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    showItems();
    handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: const Center(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationScreen'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav Screen'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
const String SEARCH_URL='https://api.waslah.app/api/v1/countries';