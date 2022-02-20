import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class ContactRepository {
  const ContactRepository({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

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
