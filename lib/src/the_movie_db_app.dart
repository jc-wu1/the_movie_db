import 'package:flutter/material.dart';

import 'features/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        canvasColor: const Color(0xff161616),

        ///here
      ),
      home: const HomePage(),
    );
  }
}
