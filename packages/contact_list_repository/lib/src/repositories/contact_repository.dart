import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class ContactRepository {
  Future<DocumentReference> addNewContact(Contact contact) {
    return FirebaseFirestore.instance
        .collection('contactList')
        .add(<String, dynamic>{
      'name': contact.name,
      'lastname': contact.lastname,
      'mobile': contact.mobile,
      'mail': contact.mail,
      'address': contact.address,
      'description': contact.description,
    });
  }
}
