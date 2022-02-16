import 'dart:async';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ContactListRepository {
  Stream<List<Contact>> contactList();
  void dispose();
  void refresh();
}

class ContactListRepositoryFireStore extends ContactListRepository {
  ContactListRepositoryFireStore({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

  final StreamController<List<Contact>> _loadedContactList =
      StreamController<List<Contact>>();

  final List<Contact> _cache = [];

  @override
  void dispose() {
    _loadedContactList.close();
  }

  @override
  void refresh() {
    firebaseFirestore
        .collection('contactList')
        .orderBy('lastname')
        .snapshots()
        .listen((snapshot) {
      _cache.clear();
      for (final document in snapshot.docs) {
        _cache.add(
          Contact(
            name: document.data()['name'] as String,
            lastname: document.data()['lastname'] as String,
            mobile: document.data()['mobile'] as String,
            mail: document.data()['mail'] as String,
            address: document.data()['address'] as String,
            description: document.data()['description'] as String,
          ),
        );
      }

      _loadedContactList.add(_cache);
    });
  }

  @override
  Stream<List<Contact>> contactList() => _loadedContactList.stream;
}
