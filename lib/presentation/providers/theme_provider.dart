import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => true);
final colorListProvider = Provider((ref) => colorList); // Inmutables
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Objetos
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // State = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  Future<void> persistTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', state.isDarkMode);
    await prefs.setInt('selectedColor', state.selectedColor);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    final selectedColor = prefs.getInt('selectedColor') ?? 1;
    state = AppTheme(
      selectedColor: selectedColor,
      isDarkMode: isDarkMode,
    );
  }

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
    persistTheme();
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
    persistTheme();
  }
}
