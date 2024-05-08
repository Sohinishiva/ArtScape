import 'package:flutter/material.dart';
import 'package:sandypi/HomePage.dart';
import 'package:sandypi/LEDControlPage.dart';
import 'package:sandypi/SignaturePad.dart';
import 'package:sandypi/PlaylistPage.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.light_mode_outlined)),
            label: 'LED',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.track_changes),
            ),
            label: 'Playlist',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.games_outlined),
            ),
            label: 'Playground',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.person),
            ),
            label: 'Account',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.my_library_add),
            ),
            label: 'MYD',
          ),
        ],
      ),
      body: <Widget>[
        HomePage(),
        LEDControlPage(),
        PlaylistPage(),
        SignaturePad(),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Account',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'make your own design',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
