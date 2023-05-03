import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/providers.dart'
    show isDarkModeProvider, colorListProvider, selectedColorProvider;

class ThemeChangeScreen extends ConsumerWidget {
  static const name = "theme_change";
  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Change Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(darkMode ? Icons.brightness_7 : Icons.brightness_3),
          ),
        ],
      ),
      body: const _ThemeChangeView(),
    );
  }
}

class _ThemeChangeView extends ConsumerWidget {
  const _ThemeChangeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            "Este color",
            style: TextStyle(color: color),
          ),
          activeColor: color,
          subtitle:
              Text("R: ${color.red}, G: ${color.green}, B: ${color.blue}"),
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.watch(selectedColorProvider.notifier).state = value!;
          },
        );
      },
    );
  }
}
