import 'package:chatmate/common/constant.dart';
import 'package:chatmate/modules/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Stack(
            children: [
              const CircleAvatar(
                radius: 50,
              ),
              Align(
                heightFactor: 3.2,
                widthFactor: 3.4,
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      border: Border.all(color: kColorDarkGrey, width: 1),
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: const Icon(Icons.edit, size: 16),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider())
        ],
        child: Consumer<ProfileProvider>(
         builder: (context, provider, _) {
           return Scaffold(
             backgroundColor: kColorGray,
             body: Column(
               children: [
                 avatar(),
                 const SizedBox(height: 30),
                 Column(
                   children: [
                     GestureDetector(
                       onTap: () => provider.signOut(),
                       child: Container(
                         margin: const EdgeInsets.all(15),
                         padding: const EdgeInsets.all(15),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: kColorWhite70
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const [
                             Icon(
                                 Icons.logout
                             ),
                             Text('Log out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                             Icon(
                                 Icons.arrow_forward_ios
                             ),
                           ],
                         ),
                       ),
                     )
                   ],
                 )
               ],
             ),
           );
         },
        )
    );
  }
}
