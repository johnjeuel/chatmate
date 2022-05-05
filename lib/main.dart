import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/routers/routers.dart';
import 'firebase_options.dart';
import 'modules/dashboard/dashboard.dart';
import 'modules/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatmateApp());
}

Future<void> initFirebase() async{
  await Firebase.initializeApp();
}
class ChatmateApp extends StatelessWidget {
  ChatmateApp({Key? key}) : super(key: key);
  final GetRouter _getRouter = GetRouter();
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  // final AuthenticationController _authenticationController = Get.find();
  Widget GetRole(User data) {
    return FutureBuilder<IdTokenResult>(
        future: data.getIdTokenResult(),
        builder: (BuildContext context, AsyncSnapshot<IdTokenResult> snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            var d = snapshot.data;
            // print('snapshot ${snapshot.data?.claims ${}');
            if (d?.claims!['roles'] == 'superadmin' || d?.claims!['roles'] == 'admin') {
              return Container();
            } else if (d?.claims!['roles'] == 'user') {
              print('dddd $d');
              // _authenticationController.setUserClaims(d!);
              return DashboardScreen();
            } else {
              return LoginScreen();
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          getPages: _getRouter.getRoutes,
          home: SafeArea(
            child: StreamBuilder<User?>(
              stream: _fireAuth.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                  var data = snapshot.data;
                  return GetRole(data!);
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return LoginScreen();
                }
              },
            ),
          ),
        );
      },
    );
  }
}