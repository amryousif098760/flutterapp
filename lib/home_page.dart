import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // Replace with your actual colors from XML
  final Color colorBackground = const Color(0xFFF9F9F9);
  final Color green = Colors.green;

  void onTabSelected(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Stack(
        children: [
          /// === Fragment Container ===
          Positioned.fill(
            bottom: 80, // height of bottom nav
            child: Container(
              color: colorBackground,
              child: Center(
                child: Text(
                  [
                    "Game Page",
                    "OfferWalls Page",
                    "CashOut Page",
                    "Profile Page"
                  ][selectedIndex],
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          /// === Bottom Navigation Card ===
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Color(0xFFDCD5D5), width: 1),
                ),
                elevation: 10,
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                    color: colorBackground,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _navItem(Icons.videogame_asset, "Game", 0),
                      _navItem(Icons.local_offer, "OfferWalls", 1),
                      _navItem(Icons.attach_money, "CashOut", 2),
                      _navItem(Icons.person, "Profile", 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => onTabSelected(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: isSelected ? green : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? green : Colors.grey,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
