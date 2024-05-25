import 'package:flutter/material.dart';
//import 'maps.dart';
import 'swap.dart';
import 'trips.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40, // Nastavenie výšky ikony
            child: Icon(Icons.double_arrow, size: 40, color: Colors.black),
          ),
          label: 'Swipe',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40, // Nastavenie výšky ikony
            child: Icon(Icons.checklist_rtl, size: 40, color: Colors.black),
          ),
          label: 'Checklist',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40, // Nastavenie výšky ikony
            child: Icon(Icons.map, size: 40, color: Colors.black),
          ),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 40, // Nastavenie výšky ikony
            child: Icon(Icons.person, size: 40, color: Colors.black),
          ),
          label: 'Profile',
        ),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomDoplnok()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TripsScreen()),
            );
            break;
          // Handle other cases for different screens
        }
      },
    );
  }
}