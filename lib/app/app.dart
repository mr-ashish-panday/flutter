import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remote_armz/app/routes/app_router.dart';
import 'package:remote_armz/app/themes/app_themes.dart';

// TODO: Add Theme Provider for light/dark mode switching
// Example: final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class RemoteArmzApp extends ConsumerWidget {
  const RemoteArmzApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Watch the theme mode provider
    // final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'RemoteArmz',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      // TODO: Set themeMode based on provider
      themeMode: ThemeMode.system, // Placeholder
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

