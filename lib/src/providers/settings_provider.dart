import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState {
  final Locale locale;
  final bool hapticsEnabled;
  const SettingsState({required this.locale, required this.hapticsEnabled});
  SettingsState copyWith({Locale? locale, bool? hapticsEnabled}) =>
      SettingsState(locale: locale ?? this.locale, hapticsEnabled: hapticsEnabled ?? this.hapticsEnabled);
}
class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier() : super(const SettingsState(locale: Locale('en'), hapticsEnabled: true)) { _load(); }
  Future<void> _load() async {
    final sp = await SharedPreferences.getInstance();
    final code = sp.getString('locale') ?? 'en';
    final haptics = sp.getBool('haptics_enabled') ?? true;
    state = state.copyWith(locale: Locale(code), hapticsEnabled: haptics);
  }
  Future<void> setLocale(Locale l) async { state = state.copyWith(locale: l); final sp = await SharedPreferences.getInstance(); await sp.setString('locale', l.languageCode); }
  Future<void> setHaptics(bool enabled) async { state = state.copyWith(hapticsEnabled: enabled); final sp = await SharedPreferences.getInstance(); await sp.setBool('haptics_enabled', enabled); }
}
final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) => SettingsNotifier());
