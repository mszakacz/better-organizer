import 'package:flutter/material.dart';
import 'package:better_organizer/contact_list/view/contact_list_page.dart';
import 'package:better_organizer/app/view/home_page.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case 'contact_list':
        return MaterialPageRoute(
          builder: (_) => const ContactListPage(),
        );

      case 'view_contact':
        return MaterialPageRoute(builder: (_) {
          Contact contact = settings.arguments as Contact;
          return ViewContactPage(contact: contact);
        });
    }
  }
}
