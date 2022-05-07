import 'package:chatmate/modules/contact/contact_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatmate/common/constant.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth user = FirebaseAuth.instance;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactProvider>(create: (_) => ContactProvider()),
      ],
      child: Consumer<ContactProvider>(
        builder: (context, provider, _) {
          // print('aaa ${user.currentUser!.uid}');
          return Scaffold(
            backgroundColor: kColorGray,
            body: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .doc(user.currentUser!.uid)
                  .collection('contacts').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return snapshot.connectionState != ConnectionState.active
                ? Center(
                  child: CircularProgressIndicator(),
                ) : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 1),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var contactId = snapshot.data!.docs[index].id;

                      return StreamBuilder(
                          stream: _firestore.collection('users').doc(contactId).snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
                              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                color: Colors.white,
                                child: ListTile(
                                  onTap: () {
                                    Get.toNamed('/chat');
                                  },
                                  leading: CircleAvatar(
                                    radius: 15,
                                  ),
                                  title: Text(data['firstName']),
                                  trailing: CircleAvatar(
                                    backgroundColor: data['isActive'] ? kColorGreen : kColorGrey,
                                    radius: 5,
                                  )
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }
                      );
                    }
                );
              },
            ),
            // body: Center(
            //   child: Container(
            //     child: Text('No Contacts Available'),
            //   ),
            // ),
          );
        },
      )
    );
  }
}