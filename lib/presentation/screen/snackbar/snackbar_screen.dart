import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hello World"),
      action: SnackBarAction(label: "Ok", onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text("lorem ipsum dolo"),
        actions: [
          TextButton(
            onPressed: context.pop,
            child: const Text("Cancelar"),
          ),
          FilledButton(
            onPressed: context.pop,
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("lorem ipsum dolo"),
                  ],
                );
              },
              child: const Text("Licencias Usadas"),
            ),
            const SizedBox(height: 10),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar Dialogo"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text("Mostrar Snackbar"),
      ),
    );
  }
}
