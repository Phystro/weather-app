import 'package:flutter/material.dart';

/// A service that stores and retrieves user settings
/// 
/// Use shared_preference package to persist user settings locally.
/// Use http package to store user settings on a web server
class SettingsService {
  /// Loads User's preferred ThemeMode from local or remote storage
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// Persist User's preferred ThemeMode to local or remote storage
  Future<void> updateThemeMode(ThemeMode theme) async {}
}