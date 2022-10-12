import 'package:admindashboardflutter/Constants/constant.dart';
import 'package:admindashboardflutter/Drawer/drawer_page.dart';
import 'package:admindashboardflutter/Layout/responsive_layout.dart';
import 'package:admindashboardflutter/Panels/Panel_Center/panel_center.dart';
import 'package:admindashboardflutter/Panels/Panel_Left/panel_left.dart';
import 'package:admindashboardflutter/Panels/Panel_Right/panel_right.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Custom_AppBar/custom_appbar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  var currentIndex = 0;
  final List<Widget> _icons = [
    const Icon(Icons.add, size: 30),
    const Icon(Icons.list, size: 30),
    const Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context)
            ? Container()
            : const CustomAppBarWidget()),
      ),
      drawer: const DrawerPage(),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? const PanelLeftPage()
            : currentIndex == 1
                ? const PanelCenterPage()
                : const PanelRightPage(),
        tablet: Row(
          children: const [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            ),
          ],
        ),
        computer: Row(
          children: const [
            Expanded(
              child: DrawerPage(),
            ),
            Expanded(
              child: PanelLeftPage(),
            ),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              items: _icons,
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : const SizedBox(),
    );
  }
}
