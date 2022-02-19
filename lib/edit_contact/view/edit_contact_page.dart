import 'package:flutter/material.dart';

class EditContactPage extends StatelessWidget {
  const EditContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Name here'),
      ),
      body: const EditContactBody(),
    );
  }
}

class EditContactBody extends StatelessWidget {
  const EditContactBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
