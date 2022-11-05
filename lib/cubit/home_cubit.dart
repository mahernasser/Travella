import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/home_page.dart';
import '../views/menu_screen.dart';
import 'app_states.dart';

class HomeCubit extends Cubit<AppStates> {
  HomeCubit() : super(AppInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List layoutPages = const [
    HomePage(),
    MenuScreen(),
  ];
  List titles = const [
    'Kimit Tours',
    'Menu',
  ];
  void pageChange(index) {
    currentIndex = index;
    emit(BnbToggleState());
  }
}
