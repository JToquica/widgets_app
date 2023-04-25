import "package:go_router/go_router.dart";
import "package:widgets_app/presentation/screen/screens.dart";

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ButtonScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => const CardsScreen(),
    ),
  ],
);
