import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimit_tours/cubit/app_states.dart';
import 'package:kimit_tours/models/user_model.dart';

class RegisterCubit extends Cubit<AppStates> {
  RegisterCubit() : super(AppInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;

  IconData visIcon = Icons.visibility_off;

  void visibilityHandle() {
    isVisible = !isVisible;
    print('objecst');
    emit(RegisterPasswordVisibilityState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String country,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      userCreate(
          name: name, email: email, country: country, uId: value.user!.uid);

      emit(UserRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserRegisterErrorState());
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String country,
    required String uId,
  }) {
    UserModel model = UserModel(
      uId: uId,
      country: country,
      email: email,
      name: name,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((err) {
      emit(CreateUserErrorState());
      print('hello error$err');
    });
  }
}
