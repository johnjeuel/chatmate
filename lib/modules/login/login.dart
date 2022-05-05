import 'package:flutter/material.dart';
import 'package:chatmate/modules/login/login_provider.dart';
import 'package:chatmate/widgets/app_text_field.dart';
import 'package:chatmate/widgets/app_button.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:chatmate/common/constant.dart';

import 'package:chatmate/common/app_strings.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(),
          ),
        ],
        child: Consumer<LoginProvider>(
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
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Form(
                            key: _formLoginKey,
                            child: Column(
                              children: [
                                AppTextFormField(
                                  initialValue: provider.email,
                                  onChanged: (v) => provider.setEmail(v),
                                ),
                                const SizedBox(height: 20),
                                AppTextFormField(
                                  initialValue: provider.password,
                                  onChanged: (v) => provider.setPassword(v),
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              const Text(kDontHaveAccount,
                                style: TextStyle(
                                    color: kColorGray500
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  Get.toNamed('signup');
                                },
                                child: const Text('Sign Up',
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
                            title: 'Log in',
                            onPressed: (){
                              if (_formLoginKey.currentState!.validate()) {
                                provider.signIn();
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
