import 'package:flutter/material.dart';
import 'package:the_movie_db/src/core/injector.dart';

import 'src/the_movie_db_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MyApp());
}
