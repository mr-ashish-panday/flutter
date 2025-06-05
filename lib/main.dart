import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:remote_armz/app/app.dart';
import 'package:path_provider/path_provider.dart';

// TODO: Add Firebase Initialization
// TODO: Add Hive Type Adapters registration if needed

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  // TODO: Open necessary Hive boxes (e.g., settings, user data)
  // Example: await Hive.openBox('settings');

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    const ProviderScope(
      child: RemoteArmzApp(),
    ),
  );
}

