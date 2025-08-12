import 'package:flutter/material.dart';
import '../swipe/swipe_screen.dart';
import '../map/map_screen.dart';
import '../shortlist/shortlist_screen.dart';
import '../profile/settings_screen.dart';
import '../events/events_screen.dart';

class HomeShell extends StatefulWidget {
  static const route = '/home';
  const HomeShell({super.key});
  @override
  State<HomeShell> createState() => _HomeShellState();
}
class _HomeShellState extends State<HomeShell> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = const [SwipeScreen(), MapScreen(), EventsScreen(), ShortlistScreen(), SettingsScreen()];
    final labels = ['Tonight','Map','Events','Shortlist','Profile'];
    final icons = const [Icons.bolt, Icons.map, Icons.event, Icons.favorite, Icons.person];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (i) => setState(() => index = i),
        destinations: List.generate(pages.length, (i) => NavigationDestination(icon: Icon(icons[i]), label: labels[i])),
      ),
    );
  }
}
