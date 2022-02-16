import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class ContactRepository {
  const ContactRepository({required this.firebaseFirestore});
  final FirebaseFirestore firebaseFirestore;

  Future<DocumentReference> addNewContact(Contact contact) {
    return firebaseFirestore.collection('contactList').add(<String, dynamic>{
      'name': contact.name,
      'lastname': contact.lastname,
      'mobile': contact.mobile,
      'mail': contact.mail,
      'address': contact.address,
      'description': contact.description,
    });
  }

  Future<void> deleteContact(String id) async {
    try {
      print('Contact has been deleted');
      return await firebaseFirestore.collection('contactList').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
