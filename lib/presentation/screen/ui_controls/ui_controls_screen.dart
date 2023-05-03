import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = "ui_controls_screen";

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlView(),
    );
  }
}

class _UIControlView extends StatefulWidget {
  const _UIControlView();

  @override
  State<_UIControlView> createState() => _UIControlViewState();
}

enum Transportation { car, plane, boat, submarine, airplane }

class _UIControlViewState extends State<_UIControlView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.airplane;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Dev Mode"),
          subtitle: const Text("Activar/Desactivar Dev Mode"),
          value: isDeveloper,
          onChanged: (value) {
            isDeveloper = value;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text("Vehiculos de Transporte:"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              title: const Text("Car"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Airplane"),
              value: Transportation.airplane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Boat"),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Plane"),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = value!;
                setState(() {});
              },
            ),
            RadioListTile(
              title: const Text("Submarine"),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                selectedTransportation = value!;
                setState(() {});
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("¿Desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) {
            wantsBreakfast = value!;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: const Text("Almuerzo?"),
          value: wantsLunch,
          onChanged: (value) {
            wantsLunch = value!;
            setState(() {});
          },
        ),
        CheckboxListTile(
          title: const Text("¿Cena?"),
          value: wantsDinner,
          onChanged: (value) {
            wantsDinner = value!;
            setState(() {});
          },
        ),
      ],
    );
  }
}
