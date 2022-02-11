import 'package:better_organizer/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:better_organizer/contact_list/list/widgets/widgets.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
                decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
              contentPadding: EdgeInsets.all(10.0),
              hintText: 'Search...',
              // border: InputBorder.none),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
              ),
            )),
          ),
        ),
      ),
      body: Center(child: ContactListWidget()),
    );
  }
}
