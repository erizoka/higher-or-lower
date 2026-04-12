import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:higher_or_lower/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp])
      .then((_) => runApp(const HigherOrLower()));
}

class HigherOrLower extends StatelessWidget {
  const HigherOrLower({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Higher or Lower',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Color(0xff35157b),
          secondary: Color(0xff3c02b8),
        ),
        textTheme: TextTheme.of(context).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white
        ),
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}