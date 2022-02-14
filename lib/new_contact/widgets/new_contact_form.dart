import 'package:flutter/material.dart';

class NewContactForm extends StatefulWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  State<NewContactForm> createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final TextEditingController _nameTextController = TextEditingController();

  String get _name => _nameTextController.text;

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(Icons.phone),
              ),
              Flexible(
                child: TextField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
