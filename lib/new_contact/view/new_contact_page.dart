import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class NewContactPage extends StatelessWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: NewContactForm(),
    );
  }
}
