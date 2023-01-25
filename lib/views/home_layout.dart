import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidable/hidable.dart';
import 'package:icon_broken/icon_broken.dart';

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
            bottomNavigationBar: Hidable(
                controller: cubit.scrollController,
                child: BottomNavigationBar(
                  selectedItemColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  currentIndex: cubit.currentIndex,
                  unselectedItemColor: Colors.indigo,
                  elevation: 0,
                  backgroundColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  onTap: cubit.pageChange,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                        label: 'Home', icon: Icon(IconBroken.Home)),
                    BottomNavigationBarItem(
                        label: 'Menus',
                        icon: Icon(
                          Icons.apps,
                        )),
                    BottomNavigationBarItem(
                        label: 'Wishlist',
                        icon: Icon(
                          IconBroken.Heart,
                        )),
                    BottomNavigationBarItem(
                        label: 'Blogs',
                        icon: Icon(
                          IconBroken.Image_2,
                        )),
                    BottomNavigationBarItem(
                        label: 'Settings',
                        icon: Icon(
                          IconBroken.Setting,
                        )),
                  ],
                )),
          );
        },
        listener: (context, state) {});
  }
}
