import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimit_tours/views/blogs_screen.dart';
import 'package:kimit_tours/views/favourite_screen.dart';

import '../views/home_page.dart';
import '../views/menu_screen.dart';
import '../views/settings.dart';
import 'app_states.dart';

class HomeCubit extends Cubit<AppStates> {
  HomeCubit() : super(AppInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  ScrollController scrollController = ScrollController();

  void initScroll() {
    scrollController = ScrollController();
    emit(BarScrollState());
  }

  int currentIndex = 0;
  bool isVisible = true;
  List layoutPages = const [
    HomePage(),
    MenuScreen(),
    WishlistScreen(),
    FeedsScreen(),
    SettingsScreen(),
  ];
  List titles = const [
    'Kimit Tours',
    'Menu',
    'WishList',
    'Blogs',
    'User Settings',
  ];
  void pageChange(index) {
    currentIndex = index;
    emit(BnbToggleState());
  }
}
