import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import './repositories.dart';
import '../models/models.dart';

class ContactListRepositoryFireStore extends ContactListRepository {
  final StreamController<List<Contact>> _loadedContactList =
      StreamController<List<Contact>>();

  final List<Contact> _cache = [];

  @override
  void dispose() {
    _loadedContactList.close();
  }

  @override
  void refresh() {
    FirebaseFirestore.instance
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
  Stream<List<Contact>> constactList() => _loadedContactList.stream;
}
