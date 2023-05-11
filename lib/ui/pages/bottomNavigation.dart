import 'package:flutter/material.dart';
import 'package:synkrama_demo/core/constants/color_constants.dart';
import 'package:synkrama_demo/ui/pages/dashboard.dart';
import 'package:synkrama_demo/ui/pages/order.dart';
import 'package:synkrama_demo/ui/pages/profile.dart';

class BottomNavigationTabs extends StatefulWidget {
  const BottomNavigationTabs({Key? key}) : super(key: key);

  @override
  _BottomNavigationTabsState createState() => _BottomNavigationTabsState();
}

class _BottomNavigationTabsState extends State<BottomNavigationTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const <Widget>[
          Dashboard(),
          Orders(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: TabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            indicatorColor: ColorConstants.buttonColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            indicatorPadding: const EdgeInsets.only(bottom: 4),
            tabs: <Widget>[
              Tab(
                  child: Image.asset(
                "assets/icons/home.png",
                color: currentIndex == 0 ? Colors.black : Colors.grey,
                height: 30,
              )),
              Tab(
                  child: Image.asset(
                "assets/icons/note.png",
                color: currentIndex == 1 ? Colors.black : Colors.grey,
                height: 30,
              )),
              Tab(
                  child: Image.asset(
                "assets/icons/user.png",
                color: currentIndex == 2 ? Colors.black : Colors.grey,
                height: 30,
              )),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
