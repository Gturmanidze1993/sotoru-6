import 'package:flutter/material.dart';
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _EventTile(title: 'Opening Night • Bassiani', date: 'Fri 23:00'),
        _EventTile(title: 'Live Cocktails • Stamba', date: 'Sat 20:00'),
      ],
    );
  }
}
class _EventTile extends StatelessWidget {
  final String title; final String date;
  const _EventTile({required this.title, required this.date});
  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(leading: Icon(Icons.event), title: Text(title), subtitle: Text(date)));
  }
}
