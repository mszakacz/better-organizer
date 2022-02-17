import 'package:flutter/material.dart';
import 'package:better_organizer/contact_list/view/contact_list_page.dart';
import 'package:better_organizer/app/view/home_page.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:better_organizer/new_contact/view/view.dart';

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
    }
  }
}
