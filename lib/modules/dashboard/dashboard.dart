import 'package:chatmate/modules/contact/contact.dart';
import 'package:chatmate/modules/dashboard/dashboard_provider.dart';
import 'package:chatmate/modules/message/message.dart';
import 'package:chatmate/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chatmate/common/constant.dart';
import 'package:chatmate/widgets/app_appbar.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider())
        ],
        child: Consumer<DashboardProvider>(
            builder: (context, provider, _) {
              return Scaffold(
                appBar: CustomAppBar(),
                drawer: null,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: provider.navigationIndex,
                  onTap: (v) {
                    provider.setNavIndex(v);
                  },
                  items: const <BottomNavigationBarItem> [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.mail),
                        label: 'Messages'
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.contact_mail),
                      label: 'Contacts',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile'
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Container(
                      width: ScreenUtil().screenWidth,
                      color: kColorGray,
                      child:
                      provider.navigationIndex == 0 ? const MessageScreen() :
                      provider.navigationIndex == 1 ? const ContactScreen() :
                      provider.navigationIndex == 2 ? const ProfileScreen() :
                      Container()
                  ),
                ),
              );
            }
        ),
    );
  }
}
