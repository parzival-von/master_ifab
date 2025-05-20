

import 'package:flutter_application_1/presentation/screen/bands/bands_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screen/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes:  [
    GoRoute(
      path: '/',
      builder: (context, state) => const DomusScreen(),
      ),
      GoRoute(
      path: '/numerator-river',
      builder: (context, state) => const NumeratorScreen(),
      ),
      GoRoute(
      path: '/videos',
      builder: (context, state) => const VideosScreen(),
      ),
      GoRoute(
      path: '/bands',
      builder: (context, state) => const BandsScreen(),
      ),
  ]
  );