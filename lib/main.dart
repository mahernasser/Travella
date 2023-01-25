import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimit_tours/cubit/attraction_details_cubit.dart';
import 'package:kimit_tours/cubit/trip_details_cubit.dart';
import 'package:kimit_tours/shared/bloc_observer.dart';
import 'package:kimit_tours/shared/styles.dart';
import 'package:kimit_tours/views/attraction_details_screen.dart';
import 'package:kimit_tours/views/chat_bot_screen.dart';
import 'package:kimit_tours/views/contact_screen.dart';
import 'package:kimit_tours/views/explore_screen.dart';
import 'package:kimit_tours/views/login_screen.dart';
import 'package:kimit_tours/views/trip_details_screen.dart';
import 'package:kimit_tours/views/verify_screen.dart';

import '../cubit/app_states.dart';
import '../cubit/home_cubit.dart';
import '../cubit/main_cubit.dart';
import '../views/home_layout.dart';
import '../views/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..initScroll(),
        ),
        BlocProvider(
          create: (context) => TripDetailsCubit()..initScroll(),
        ),
        BlocProvider(
          create: (context) => AttractionCubit(),
        ),
      ],
      child: BlocConsumer<MainCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return MaterialApp(
            routes: {
              '/home_layout': (context) => const HomeLayout(),
              '/attraction_details': (context) => AttractionDetailsScreen(),
              '/menu': (context) => const MenuScreen(),
              '/explore_screen': (context) => const ExploreScreen(),
              '/trip_details_screen': (context) => const TripDetailsScreen(),
              '/': (context) => const HomeLayout(),
              '/contact_screen': (context) => const ContactScreen(),
              '/verify_screen': (context) => const VerifyScreen(),
              '/chatbot': (context) => const ChatPage(),
            },
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
