import 'package:driver_app/Tab%20Pages/earning_page.dart';
import 'package:driver_app/Tab%20Pages/home_page.dart';
import 'package:driver_app/Tab%20Pages/profile_page.dart';
import 'package:driver_app/Tab%20Pages/rateing_page.dart';
import 'package:driver_app/Utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeTabPage(),
          EarningsTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.credit_card),
        label: "Earnings"),
         BottomNavigationBarItem(icon: Icon(Icons.star),
        label: "Ratings"),
         BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Profile"),
      ],
      unselectedItemColor: gColor.withOpacity(0.5),
      selectedItemColor: wColor,
      backgroundColor: bColor,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 14
      ),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemClicked,
      ),
    );
  }
}
