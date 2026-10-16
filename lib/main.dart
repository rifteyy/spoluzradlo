import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(url: Env.supabaseUrl, publishableKey: Env.supabasePublishableKey);

  runApp(const ProviderScope(child: SpoluzradloApp()));
}

class SpoluzradloApp extends StatelessWidget {
  const SpoluzradloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Spolužrádlo',
      home: Scaffold(body: Center(child: Text('Spolužrádlo'))),
    );
  }
}
