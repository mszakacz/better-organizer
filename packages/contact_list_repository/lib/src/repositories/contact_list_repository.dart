import 'dart:async';
import '../models/models.dart';

abstract class ContactListRepository {
  Stream<List<Contact>> constactList();
  void dispose();
  void refresh();
}

class ContactListRepositoryMemory extends ContactListRepository {
  final StreamController<List<Contact>> _constactList = StreamController();

  @override
  void refresh() {
    _constactList.add(
      [
        const Contact(
          name: 'Marcus',
          lastname: 'Smart',
          mobile: '25436785675',
          mail: 'smart13@gmail.com',
          address: 'Boston',
          description: '',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _constactList.close();
  }

  @override
  Stream<List<Contact>> constactList() => _constactList.stream;
}
