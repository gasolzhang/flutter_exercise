import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem(String iconName, String title)
      : super(
            icon: Image.asset('assets/images/$iconName.png', width: 24),
            activeIcon: Image.asset(
              'assets/images/${iconName}_active.png',
              width: 24,
            ),
            title: Text(
              title,
              style: GoogleFonts.cuteFont(),
            ));
}
