//External
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Internal
import 'package:gh_search_app/Screens/detail_screen.dart';
import 'package:gh_search_app/Screens/search_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/search': (context) => const SearchScreen(),
        '/detail': (context) => const DetailScreen(),
      },
      home: SearchScreen(),
    );
  }
}
