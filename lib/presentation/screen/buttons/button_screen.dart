import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () {
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated"),
            ),
            const ElevatedButton(
                onPressed: null, child: Text("Elevated Disabled")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text("Elevated Icon"),
            ),
            FilledButton(onPressed: () {}, child: const Text("Filled")),
            FilledButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
                label: const Text("Filled Icon")),
            OutlinedButton(onPressed: () {}, child: const Text("Outlined")),
            OutlinedButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
                label: const Text("Outlined")),
            TextButton(onPressed: () {}, child: const Text("Text")),
            TextButton.icon(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {},
                label: const Text("Text")),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: MaterialStatePropertyAll(Colors.white),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Hola Mundo",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
