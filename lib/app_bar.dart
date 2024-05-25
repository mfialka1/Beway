import 'package:flutter/material.dart';
import 'nastavenia.dart';




class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.green,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0), //odstup okolo widgetov/posuva travi
            child: Text(
              "Travi",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const Spacer(),  //zabera volny priestor medzi widgetmi

 //---------------------------------------------------------------         
           IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.search, // Ikona hamburger menu
                  color: Colors.white, // Biela farba ikony
                  size: 32, // Zväčšená veľkosť ikony
                ),
              ),

//---------------------------------------------------------------
IconButton(
  onPressed: () {
    OtherClass().someMethod(context); // Volanie metódy someMethod z druhého súboru
  },
  icon: const Icon(
                  Icons.menu, // Ikona hamburger menu
                  color: Colors.white, // Biela farba ikony
                  size: 32, // Zväčšená veľkosť ikony
                ),
),




        ],
      ),
    );
  }
}