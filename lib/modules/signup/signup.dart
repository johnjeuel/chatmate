import 'package:chatmate/modules/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'package:chatmate/common/constant.dart';
import 'package:chatmate/widgets/app_button.dart';
import 'package:chatmate/widgets/app_text_field.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final _formSignupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignupProvider>(
            create: (_) => SignupProvider(),
          ),
        ],
        child: Consumer<SignupProvider>(
          builder: (_, provider, __) {
            return Scaffold(
                backgroundColor: Colors.cyan,
                body: Stack(
                  children: [
                    Positioned(
                      left: 70,
                      child: Image.asset(
                        'assets/images/chat_bubble.png',
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 450,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Form(
                              key: _formSignupKey,
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    initialValue: provider.email,
                                    labelText: 'Email',
                                    onChanged: (v) => provider.setEmail(v),
                                  ),
                                  const SizedBox(height: 20),
                                  AppTextFormField(
                                    initialValue: provider.password,
                                    labelText: 'Password',
                                    onChanged: (v) => provider.setPassword(v),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 20),
                                  AppTextFormField(
                                    labelText: 'First Name',
                                    initialValue: provider.firstName,
                                    onChanged: (v) => provider.setFirstName(v),
                                  ),
                                  const SizedBox(height: 20),
                                  AppTextFormField(
                                    labelText: 'Last Name',
                                    initialValue: provider.lastName,
                                    onChanged: (v) => provider.setLastName(v),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Text('Back to',
                                  style: TextStyle(
                                      color: kColorGray500
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.toNamed('login');
                                  },
                                  child: const Text('Log in',
                                    style: TextStyle(
                                        color: kColorBlue
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppButton(
                              title: 'Sign up',
                              onPressed: (){
                                if (_formSignupKey.currentState!.validate()) {

                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            );
          },
        )
    );
  }
}
