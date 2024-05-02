import "package:first_app/pages/cart_page.dart";
import "package:first_app/widgets/home_screen_widget.dart";
import "package:flutter/material.dart";

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreenPage> {
  List<Widget> pages = const [HomeScreenWidget(), CartPage()];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "",
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
           Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(
              Icons.home,
              size: 30,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
    );
  }
}
