import 'package:flutter/material.dart';

class NewContactPage extends StatelessWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: const Text('New Contact Form'),
    );
  }
}
