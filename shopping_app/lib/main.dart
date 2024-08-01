import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //providers are used for state managemnt that means they store the data in one place and it can be accessed by all widgets in a widget tree.
    //if we have to make multiple providers in our app the we can use multiprovider.
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: 
        ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor:const Color.fromRGBO(254, 206, 1, 1),
            primary:const Color.fromRGBO(254, 206, 1, 1),
            ),
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.oswald(),
            titleLarge:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            )
          ),
          
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
      
            ),
            prefixIconColor: Color.fromARGB(137, 54, 53, 53), 
          ),
          primaryTextTheme: 
          const TextTheme(
              titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
             ),
             titleSmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w200,
             ),
          ),
        ),
        home:const HomePage(),
        
      ),
    );
  }
}
