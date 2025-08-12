import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          const ListTile(title: Text('Settings')),
          SwitchListTile(title: const Text('Haptics'), value: s.hapticsEnabled, onChanged: (v) => ref.read(settingsProvider.notifier).setHaptics(v)),
          const Divider(),
          const ListTile(title: Text('Language')),
          RadioListTile(value: 'en', groupValue: s.locale.languageCode, onChanged: (_) => ref.read(settingsProvider.notifier).setLocale(const Locale('en')), title: const Text('English')),
          RadioListTile(value: 'ka', groupValue: s.locale.languageCode, onChanged: (_) => ref.read(settingsProvider.notifier).setLocale(const Locale('ka')), title: const Text('Georgian')),
        ],
      ),
    );
  }
}
