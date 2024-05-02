import 'package:first_app/pages/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart_item.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartItem(),
        ),
        Provider(create: (context) => "Taha",),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown.shade900,
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            elevation: 100,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(42, 149, 250, 1),
          ),
          primaryColor: Color.fromRGBO(42, 149, 250, 1),
          fontFamily: "Lato",
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: "Lato-Bold",
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 40,
          ),
        ),
        title: "Shopping App",
        home: const HomeScreenPage(),
      ),
    );
  }
}
