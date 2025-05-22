import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_1/config/router/app_router.dart';
import 'package:flutter_application_1/config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tenebrisModusEst = ref.watch(estTenebrisModusProvider);
    final electusColor = ref.watch(electusColorProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(electusColor: electusColor, tenebrisModusEst: tenebrisModusEst).getTheme(),
    );
  }
}
