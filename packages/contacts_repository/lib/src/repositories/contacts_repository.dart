import 'dart:async';
import '../models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsRepository {
  ContactsRepository({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

  final StreamController<List<Contact>> _loadedContactList =
      StreamController<List<Contact>>();

  final List<Contact> _cache = [];

  void dispose() {
    _loadedContactList.close();
  }

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
            id: document.id,
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

  Stream<List<Contact>> contactList() => _loadedContactList.stream;

  Future<void> addNewContact(Contact contact) {
    return firebaseFirestore.collection('contactList').add(<String, dynamic>{
      'name': contact.name,
      'lastname': contact.lastname,
      'mobile': contact.mobile,
      'mail': contact.mail,
      'address': contact.address,
      'description': contact.description,
    });
  }

  Future<void> editContact(Contact contact) {
    return firebaseFirestore.collection('contactList').doc(contact.id).update({
      'name': contact.name,
      'lastname': contact.lastname,
      'mobile': contact.mobile,
      'mail': contact.mail,
      'address': contact.address,
      'description': contact.description,
    });
  }

  Future<void> deleteContact(String id) async {
    return await firebaseFirestore.collection('contactList').doc(id).delete();
  }

  Future<Contact> getContact(String id) async {
    final document =
        await firebaseFirestore.collection('contactList').doc(id).get();

    final contact = Contact(
      id: document.id,
      name: document.data()?['name'] as String,
      lastname: document.data()?['lastname'] as String,
      mobile: document.data()?['mobile'] as String,
      mail: document.data()?['mail'] as String,
      address: document.data()?['address'] as String,
      description: document.data()?['description'] as String,
    );
    return contact;
  }
}
