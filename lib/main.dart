import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_page/bloc/onboarding_bloc.dart';
import 'package:onboarding_page/screens/onboarding_screen.dart';


void main()
{
  runApp( BlocProvider(
    create: (context) => OnboardingBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme:const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen()
    );
  }
}