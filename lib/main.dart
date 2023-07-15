import 'package:flutter/material.dart';
import '/ProviderModel/contactmodel.dart';
import '/ProviderModel/themeChanger.dart';
import 'package:provider/provider.dart';
import 'screen/contactScreen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themechange(),
        )
      ],
      builder: (context, child) {
        final themeProvider = Provider.of<themechange>(context);
        return MaterialApp(
          theme: themeProvider.theme,
          debugShowCheckedModeBanner: false,
          home: ContactScreen(),
        );
      },
    );
  }
}
