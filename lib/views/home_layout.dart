import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_states.dart';
import '../cubit/home_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, AppStates>(
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.layoutPages[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: cubit.pageChange,
              selectedIconTheme: const IconThemeData(
                color: Colors.orange
              ),
              unselectedIconTheme: IconThemeData(
                color: Colors.grey,
              ),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),

              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
