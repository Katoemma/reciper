import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reciper/screens/navigator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jwgrkfbpmlzmdogvjrnr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp3Z3JrZmJwbWx6bWRvZ3Zqcm5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAyNTE2MDIsImV4cCI6MjAzNTgyNzYwMn0.Vq5HLGwO6K414ePy701r-oD91LQ5izQaXmdxhIHeRBk',
  );
  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Doctor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppNavigator(),
    );
  }
}
