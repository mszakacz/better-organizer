import 'package:flutter/material.dart';
import 'package:contact_list_repository/contact_list_repository.dart';
import 'package:marquee/marquee.dart';

class ContactInformations extends StatefulWidget {
  final Contact contact;
  const ContactInformations({Key? key, required this.contact})
      : super(key: key);

  @override
  State<ContactInformations> createState() => _ContactInformationsState();
}

class _ContactInformationsState extends State<ContactInformations> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 100),
        Center(
          child: CircleAvatar(
            radius: 100,
            child: ClipRRect(
              child: Image.network(
                  'https://vimcare.com/assets/empty_user-e28be29d09f6ea715f3916ebebb525103ea068eea8842da42b414206c2523d01.png'),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            '${widget.contact.name} ${widget.contact.lastname}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Icon(Icons.phone),
            ),
            Text(widget.contact.mobile),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Icon(Icons.mail),
            ),
            Text(widget.contact.mail),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Icon(Icons.location_pin),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 150),
              height: 50,
              child: Marquee(
                text: widget.contact.address,
                pauseAfterRound: const Duration(seconds: 3),
                startPadding: 5,
                blankSpace: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
