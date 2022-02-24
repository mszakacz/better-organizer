import 'package:better_organizer/app/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:contacts_repository/contacts_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final ContactsRepository _contactsRepository =
      ContactsRepository(firebaseFirestore: firebaseFirestore)..refresh();

  runApp(App(
    contactsRepository: _contactsRepository,
  ));
}
