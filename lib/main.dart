import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/app_state.dart';
import 'src/api.dart';

void main() async {
  //await DotEnv().load(fileName: '.env');
//DotEnv().env['X-RapidAPI-Key']!
  final api = ZomatoApi("17695cba14msh9439077c8485297p18cbd9jsn09c76ba55b73");
  await api.loadCategories();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => api),
        Provider(create: (context) => AppState()),
      ],
      child: const RestaurantSearchApp(),
    ),
  );
}
