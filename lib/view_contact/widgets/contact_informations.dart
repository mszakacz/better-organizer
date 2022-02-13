import 'package:flutter/material.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class ContactInformations extends StatelessWidget {
  final Contact contact;
  const ContactInformations({Key? key, required this.contact})
      : super(key: key);

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
            '${contact.name} ${contact.lastname}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Table(
        //   children: [
        //     TableRow(
        //       children: [
        //         Text('Mobile:'),
        //         Text('Mail:'),
        //         Text('Addres:'),
        //       ],
        //     ),
        //     TableRow(
        //       children: [
        //         Text('${contact.mobile}'),
        //         Text('${contact.mail}'),
        //         Text('${contact.address}'),
        //       ],
        //     )
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text('Mobile:'),
                Text('Mail:'),
                Text('Addres:'),
              ],
            ),
            Column(
              children: [
                Text(contact.mobile),
                Text(contact.mail),
                Text(contact.address),
              ],
            )
          ],
        )
      ],
    );
  }
}
