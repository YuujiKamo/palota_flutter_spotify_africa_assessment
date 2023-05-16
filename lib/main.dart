import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/routes.dart';
import 'package:provider/provider.dart';

import 'misc/helpers.dart';

void main() {
  runApp(const PalotaAssessmentApp());
}

class PalotaAssessmentApp extends StatelessWidget {
  const PalotaAssessmentApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryLoader())
      ],
      child: MaterialApp(
        title: 'Palota Spotify Africa Assessment',
        theme: ThemeData.dark(useMaterial3: true),
        initialRoute: AppRoutes.startUp,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
