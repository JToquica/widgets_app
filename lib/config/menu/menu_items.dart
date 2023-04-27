import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItem> appMenuItems = [
  MenuItem(
    title: "Botones",
    subtitle: "Varios Botones",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subtitle: "Contenedor Estilizado",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Progress Indicator",
    subtitle: "Generales y Controlados",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "Snackbar y Dialogos",
    subtitle: "Indicadores en Pantalla",
    link: "/snackbars",
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "Animated Container",
    subtitle: "Stateful widget animado",
    link: "/animated",
    icon: Icons.play_arrow,
  ),
  MenuItem(
    title: "UI Controls",
    subtitle: "Serie de controles de Flutter",
    link: "/ui-controls",
    icon: Icons.check_box,
  ),
  MenuItem(
    title: "App Tutorial",
    subtitle: "Tutorial Intro App",
    link: "/tutorial",
    icon: Icons.accessibility_new_rounded,
  ),
  MenuItem(
    title: "Infinite Scroll y Pull",
    subtitle: "Listas infinitas y pull to refresh",
    link: "/infinite",
    icon: Icons.list,
  ),
];
