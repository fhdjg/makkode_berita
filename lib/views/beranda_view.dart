import 'package:flutter/material.dart';
import '../controllers/home_controller.dart' as home_c;

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  @override
  State<BerandaView> createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home_c.pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            pageIndex = value;
            setState(() {});
          },
          currentIndex: pageIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Berita',
              icon: Icon(Icons.newspaper),
            ),
            BottomNavigationBarItem(
              label: 'Bookmark',
              icon: Icon(Icons.bookmark_outline),
            ),
          ]),
    );
  }
}
