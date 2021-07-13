
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/Screens/Home_Screen/Home.dart';
import 'package:travelapp/Screens/Welcome_screen/Welcome_screen.dart';


class BottomNavigationBarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigationBarScreen> {

  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _widgetOptions = [
    HomePage(),
    WelcomeScreen(),

  ];

  void _onpagechanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedindex) {
    print(selectedindex);
    _pageController.jumpToPage(selectedindex);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
// appBar: Appbarwidget.getAppBar('world'),
      body: PageView(
        controller: _pageController,
        children: _widgetOptions,
        onPageChanged: _onpagechanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 50,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
        currentIndex: _selectedIndex,
     //   backgroundColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30),
            label: '',

            //backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined,size: 30),
            label: '',
// title: Text('hello',style: TextStyle(
// color: _selectedIndex == 0? Colors.blue:Colors.grey,
// ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_sharp,size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,size: 30,),
            label: ' ',
          ),
        ],
      ),
    );
  }
}

// color: Colors.indigo,