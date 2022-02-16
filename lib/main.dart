import 'package:better_organizer/app/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final ContactListRepository _contactListRepository =
      ContactListRepositoryFireStore(firebaseFirestore: firebaseFirestore)
        ..refresh();

  final ContactRepository _contactRepository = ContactRepository();

  runApp(App(
    contactListRepository: _contactListRepository,
    contactRepository: _contactRepository,
  ));
}
