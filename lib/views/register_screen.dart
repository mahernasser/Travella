import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimit_tours/cubit/register_cubit.dart';
import 'package:kimit_tours/views/home_layout.dart';
import 'package:kimit_tours/views/login_screen.dart';

import '../cubit/app_states.dart';
import '../shared/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var registerFormKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, AppStates>(
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
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
                      child: Container(
                        alignment: Alignment.center,
                        child: const Center(
                          child: Text(
                            'Kemet Tours',
                            style: TextStyle(
                              shadows: [
                                BoxShadow(
                                  offset: Offset(3, 3),
                                  color: Colors.black,
                                ),
                              ],
                              fontFamily: 'mesiri',
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        // width: double.infinity,
                        // height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Form(
                              key: registerFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  titleBuilder('Register !', context),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customField(
                                      context: context,
                                      label: 'User name',
                                      prefixIcon: Icons.person,
                                      validator: (value) {
                                        {
                                          if (value!.isEmpty) {
                                            return 'Name must be filled';
                                          }
                                        }
                                        return null;
                                      },
                                      controller: nameController),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customField(
                                    inputType: TextInputType.emailAddress,
                                    context: context,
                                    label: 'Email Address',
                                    labelStyle: const TextStyle(
                                      fontFamily: 'oxygen',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: Color(0xFF113861),
                                    ),
                                    prefixIcon: Icons.email_outlined,
                                    validator: (value) {
                                      {
                                        if (value!.isEmpty) {
                                          return 'Email Address must be filled';
                                        }
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customField(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          cubit.visibilityHandle();
                                        },
                                        icon: Icon(cubit.isVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility)),
                                    isVisible: cubit.isVisible,
                                    context: context,
                                    label: 'Password',
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customField(
                                    isVisible: true,
                                    context: context,
                                    label: 'Confirm Password',
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
                                        } else if (passController.text !=
                                            value) {
                                          return 'Password doesn\'t match';
                                        }
                                      }
                                      return null;
                                    },
                                    controller: confirmPassword,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  customField(
                                      readOnly: true,
                                      onTap: () {
                                        showCountryPicker(
                                          countryListTheme:
                                              CountryListThemeData(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          context: context,
                                          showPhoneCode: false,
                                          // optional. Shows phone code before the country name.
                                          onSelect: (Country country) {
                                            print(
                                                'Select country: ${country.displayName}');
                                            countryController.text =
                                                country.name;
                                          },
                                        );
                                      },
                                      context: context,
                                      label: 'Country',
                                      prefixIcon: Icons.location_on_outlined,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Country must be filled';
                                        }
                                        return null;
                                      },
                                      controller: countryController),
                                  const SizedBox(
                                    height: 20,
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
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xFF113861)),
                                      ),
                                      onPressed: () {
                                        if (registerFormKey.currentState!
                                            .validate()) {
                                          cubit.userRegister(
                                            email: emailController.text,
                                            password: passController.text,
                                            country: countryController.text,
                                            name: nameController.text,
                                          );
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) {
                                          //   return const HomeLayout();
                                          // }));
                                        }
                                      },
                                      child: const Text(
                                        'Sign up',
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
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have account?',
                                        style: TextStyle(
                                            fontFamily: 'oxygen',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          navigateReplacement(
                                              context: context,
                                              widget: LoginScreen());
                                        },
                                        child: const Text(
                                          'Login here!',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'oxygen',
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF113861)),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
          if (state is CreateUserSuccessState) {
            navigateReplacement(context: context, widget: HomeLayout());
          }
        },
      ),
    );
  }
}
