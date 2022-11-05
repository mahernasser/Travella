import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kimit_tours/cubit/app_states.dart';
import 'package:kimit_tours/cubit/login_cubit.dart';
import 'package:kimit_tours/shared/components.dart';
import 'package:kimit_tours/shared/constants.dart';
import 'package:kimit_tours/views/home_layout.dart';
import 'package:kimit_tours/views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, AppStates>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: const AssetImage(
                          'assets/images/login_background.jpg'),
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).primaryColor.withOpacity(.9),
                        BlendMode.modulate,
                      )),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Center(
                              child: Text(
                                'KEMET',
                                style: TextStyle(
                                  shadows: [
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      color: Colors.black,
                                    ),
                                  ],
                                  fontFamily: 'mesiri',
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Login and live the experience',
                            style: TextStyle(
                              shadows: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  color: Colors.black,
                                  blurRadius: 15,
                                ),
                              ],
                              color: Colors.grey,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'mesiri',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                            )),
                        // width: double.infinity,
                        // height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Form(
                                  key: loginFormKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      // titleBuilder('Login !', context),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      143, 148, 251, .2),
                                                  blurRadius: 20.0,
                                                  offset: Offset(0, 10))
                                            ]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[100]!))),
                                              child: customField(
                                                  context: context,
                                                  hintText: 'Email Address',
                                                  labelStyle: const TextStyle(
                                                    fontFamily: 'oxygen',
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 15,
                                                    color: Color(0xFF113861),
                                                  ),
                                                  prefixIcon:
                                                      Icons.email_outlined,
                                                  border: InputBorder.none,
                                                  validator: (value) {
                                                    {
                                                      if (value!.isEmpty) {
                                                        return 'Email Address must be filled';
                                                      }
                                                    }
                                                    return null;
                                                  },
                                                  controller: emailController),
                                            ),
                                            // const SizedBox(
                                            //   height: 30,
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: customField(
                                                border: InputBorder.none,
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    cubit.visibilityHandle();
                                                    print('object');
                                                  },
                                                  icon: Icon(
                                                    cubit.isVisible
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                  ),
                                                ),
                                                isVisible: cubit.isVisible,
                                                context: context,
                                                hintText: 'Password',
                                                labelStyle: const TextStyle(
                                                  fontFamily: 'oxygen',
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15,
                                                  color: Color(0xFF113861),
                                                ),
                                                prefixIcon: Icons.lock,
                                                validator: (value) {
                                                  {
                                                    if (value!.isEmpty) {
                                                      return 'Password must be filled';
                                                    }
                                                  }
                                                  return null;
                                                },
                                                controller: passController,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            )),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    const Color(0xFF113861)),
                                          ),
                                          onPressed: () {
                                            if (loginFormKey.currentState!
                                                .validate()) {
                                              cubit.userLogin(
                                                  email: emailController.text,
                                                  password:
                                                      passController.text);
                                            }
                                          },
                                          child: const Text(
                                            'Sign in',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'oxygen',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Forget Password?',
                                                style: TextStyle(
                                                    color: Color(0xFF113861),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            color: Colors.grey,
                                            height: 0.3,
                                          ),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  right: 15, left: 15),
                                              color: Colors.white,
                                              child: const Text(
                                                'OR login with',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              print('hello');
                                            },
                                            child: Image.asset(
                                              'assets/images/fb_sign.png',
                                              height: 45,
                                              width: 45,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 38,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('hello');
                                            },
                                            child: Image.asset(
                                                'assets/images/gmail_sign.png',
                                                height: 45,
                                                width: 45),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Don\'t have an account?',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'oxygen',
                                                fontWeight: FontWeight.w800),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                navigateReplacement(
                                                    context: context,
                                                    widget:
                                                        const RegisterScreen());
                                              },
                                              child: const Text(
                                                'Register',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.indigo),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateReplacement(context: context, widget: const HomeLayout());
          } else if (state is LoginErrorState) {
            if (state.error == firebaseWrongPassword) {
              Fluttertoast.showToast(
                  msg: passToastMsg,
                  backgroundColor: Theme.of(context).primaryColor);
            } else if (state.error == firebaseWrongEmail) {
              Fluttertoast.showToast(
                  msg: emailToastMsg,
                  backgroundColor: Theme.of(context).primaryColor);
            } else if (state.error == firebaseEmailFormat) {
              Fluttertoast.showToast(
                  msg: emailFormatToastMsg,
                  backgroundColor: Theme.of(context).primaryColor);
            } else {
              Fluttertoast.showToast(
                  msg: state.error,
                  backgroundColor: Theme.of(context).primaryColor);
            }
            print(state.error);
          }
        },
      ),
    );
  }
}
