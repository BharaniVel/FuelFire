import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuelfire/Homepage/homeviewpage.dart';
import 'package:fuelfire/totlaview/totalviewpage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _ispage = 0;
  late PageController pagecontroller = PageController();

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pagecontroller.jumpToPage(page);
  }

  void pagechanged(int page) {
    setState(() {
      _ispage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [const Homepageview(), TotalViewPage()],
        controller: pagecontroller,
        onPageChanged: pagechanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        height: MediaQuery.of(context).size.height * 0.068,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _ispage == 0 ? Colors.white : Colors.grey,
            ),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _ispage == 1 ? Colors.white : Colors.grey,
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
