import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimit_tours/shared/bloc_observer.dart';
import 'package:material_color_generator/material_color_generator.dart';

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
        // BlocProvider(
        //   create: (context) => TripCubit()..handleScroll() ,
        // ),
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        )
      ],
      child: BlocConsumer<MainCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return MaterialApp(
            routes: {
              '/home_layout': (context) => const HomeLayout(),
              '/menu': (context) => const MenuScreen(),
              '/': (context) => HomeLayout(),
            },
            darkTheme: ThemeData(
                primaryColor: const Color(0xffF5A31B),
                drawerTheme:
                    const DrawerThemeData(backgroundColor: Colors.black),
                scaffoldBackgroundColor: Colors.black,
                errorColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                textTheme: TextTheme(
                  displaySmall: TextStyle(
                      color: Colors.white.withOpacity(0.80),
                      fontSize: 15,
                      fontFamily: 'oxygen'),
                  labelSmall: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'oxygen',
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  labelLarge: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'oxygen',
                    fontSize: 21,
                    overflow: TextOverflow.fade,
                  ),
                  titleMedium: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'mesiri',
                      color: Colors.white),
                )),
            theme: ThemeData(
              primarySwatch:
                  generateMaterialColor(color: const Color(0xffF5A31B)),
              scaffoldBackgroundColor: Colors.white,
              primaryColor: const Color(0xffF5A31B),
              drawerTheme: const DrawerThemeData(
                backgroundColor: Color(0xffF5A31B),
              ),
              errorColor: const Color(0xffF5A31B),
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xffF5A31B),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              textTheme: const TextTheme(
                displaySmall: TextStyle(
                    color: Colors.black, fontSize: 15, fontFamily: 'oxygen'),
                labelLarge: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'oxygen',
                  fontSize: 21,
                  overflow: TextOverflow.fade,
                ),
                labelSmall: TextStyle(
                    color: Colors.black,
                    fontFamily: 'oxygen',
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
                titleMedium: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'mesiri'),
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
