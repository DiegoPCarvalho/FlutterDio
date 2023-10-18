// ignore_for_file: deprecated_member_use

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/shared/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tab;
  @override
  void initState() {
    // TODO: implement initState

    tab = TabController(initialIndex: 0, length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My App",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: const Color.fromARGB(255, 12, 83, 35),
          ),
          drawer: const CustomDrawer(),
          body: TabBarView(
            controller: tab,
            children: [
              Container(color: const Color.fromARGB(255, 10, 79, 136)),
              Container(
                color: const Color.fromARGB(255, 11, 161, 16),
              ),
              Container(color: Colors.red),
              Container(color: Colors.black),
              Container(color: Colors.yellow),
            ],
          ),
          bottomNavigationBar: ConvexAppBar.badge(
            {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Disco'),
              TabItem(icon: Icons.add, title: 'Add'),
              TabItem(icon: Icons.message, title: 'Message'),
              TabItem(icon: Icons.people, title: 'Profile'),
            ],
            onTap: (int i) => tab.index = i,
          )),
    );
  }
}
