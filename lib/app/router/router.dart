import 'package:better_organizer/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:better_organizer/contact_list/view/contact_list_page.dart';
import 'package:better_organizer/app/view/home_page.dart';

class AppRouter {
  Route? onGenerateRout(RouteSettings settings) {
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
