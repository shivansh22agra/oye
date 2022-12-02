import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/Page2.dart';
import 'package:flutter_app/screens/page3.dart';
import 'package:flutter_app/screens/page4.dart';

class Home_Page extends StatefulWidget {
  //static String id = "Home_Screen";

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  int? currentindex;
  PageController pageController = PageController();
  void ontap(int page) {
    setState(() {
      currentindex = page;
      // print(index);
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        
        children: [HomePage(), page2(), Page3(), page4()],
        controller: pageController,
        onPageChanged: (Index) {
          setState(() {
            currentindex = Index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Color(0xFF333333)),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedFontSize: 15,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.grey,
        unselectedFontSize: 12,
         currentIndex:  currentindex??0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.black), label: "Bookings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_rounded, color: Colors.black),
              label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: Colors.black),
              label: "Account")
        ],
      ),
    );
  }
}
