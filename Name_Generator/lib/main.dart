import 'package:flutter/material.dart';
import 'package:name_generator/Boys/baeries.dart';
import 'package:name_generator/Boys/baquarius.dart';
import 'package:name_generator/Boys/bcancer.dart';
import 'package:name_generator/Boys/bcapricorn.dart';
import 'package:name_generator/Boys/bgemini.dart';
import 'package:name_generator/Boys/bleo.dart';
import 'package:name_generator/Boys/blibra.dart';
import 'package:name_generator/Boys/bpisces.dart';
import 'package:name_generator/Boys/bsagittarius.dart';
import 'package:name_generator/Boys/bscorpio.dart';
import 'package:name_generator/Boys/btaurus.dart';
import 'package:name_generator/Boys/bvirgo.dart';
import 'package:name_generator/Girls/gaeries.dart';
import 'package:name_generator/Girls/gaquarius.dart';
import 'package:name_generator/Girls/gcancer.dart';
import 'package:name_generator/Girls/gcapricorn.dart';
import 'package:name_generator/Girls/ggemini.dart';
import 'package:name_generator/Girls/gleo.dart';
import 'package:name_generator/Girls/glibra.dart';
import 'package:name_generator/Girls/gpisces.dart';
import 'package:name_generator/Girls/gsagittarius.dart';
import 'package:name_generator/Girls/gscorpio.dart';
import 'package:name_generator/Girls/gtaurus.dart';
import 'package:name_generator/Girls/gvirgo.dart';
import 'package:name_generator/Screens/boy_screen.dart';
import 'package:name_generator/Screens/girl_screen.dart';
import 'package:name_generator/Screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/boys_names': (context) => BoysNamesScreen(),
        '/baeries': (context) => const BAriesScreen(),
        '/btaurus': (context) => const BTaurusScreen(),
        '/bgemini': (context) => const BGeminiScreen(),
        '/bcancer': (context) => const BCancerScreen(),
        '/bleo': (context) => const BLeoScreen(),
        '/bvirgo': (context) => const BVirgoScreen(),
        '/blibra': (context) => const BLibraScreen(),
        '/bscorpio': (context) => const BScorpioScreen(),
        '/bsagittarius': (context) => const BSagittariusScreen(),
        '/bcapricorn': (context) => const BCapricornScreen(),
        '/baquarius': (context) => const BAquariusScreen(),
        '/bpisces': (context) => const BPiscesScreen(),
        '/girls_names': (context) => GirlsNamesScreen(),
        '/gaeries': (context) => const GAeriesScreen(),
        '/gtaurus': (context) => const GTaurusScreen(),
        '/ggemini': (context) => const GGeminiScreen(),
        '/gcancer': (context) => const GCancerScreen(),
        '/gleo': (context) => const GLeoScreen(),
        '/gvirgo': (context) => const GVirgoScreen(),
        '/glibra': (context) => const GLibraScreen(),
        '/gscorpio': (context) => const GScorpioScreen(),
        '/gsagittarius': (context) => const GSagittariusScreen(),
        '/gcapricorn': (context) => const GCapricornScreen(),
        '/gaquarius': (context) => const GAquariusScreen(),
        '/gpisces': (context) => const GPiscesScreen(),
      },
    );
  }
}
