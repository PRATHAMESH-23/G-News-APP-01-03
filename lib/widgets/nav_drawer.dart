import 'package:flutter/material.dart';
// import 'package:get/get.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * 70 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: theme.colorScheme.secondary),
            height: MediaQuery.of(context).size.height * 20 / 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "G-News",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                Text(
                  "Stay Informed..",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          listCard("Home", Icons.home),
          listCard("Reading History", Icons.history),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.sunny),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Text(
                      "Dark Mode",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget listCard(String name, IconData svgIcon, {Function()? onClicked}) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(svgIcon),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.0,
          ),
        ]),
      ),
    );
  }
}
