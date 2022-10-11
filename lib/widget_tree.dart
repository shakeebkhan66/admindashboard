import 'package:admindashboardflutter/Drawer/drawer_page.dart';
import 'package:admindashboardflutter/Layout/responsive_layout.dart';
import 'package:admindashboardflutter/Panels/Panel_Center/panel_center.dart';
import 'package:admindashboardflutter/Panels/Panel_Left/panel_left.dart';
import 'package:admindashboardflutter/Panels/Panel_Right/panel_right.dart';
import 'package:flutter/material.dart';

import 'Custom_AppBar/custom_appbar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
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
        phone: const PanelCenterPage(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftPage(),),
            Expanded(child: PanelCenterPage(),),
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftPage(),),
            Expanded(child: PanelCenterPage(),),
            Expanded(child: PanelRightPage(),),
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child: DrawerPage(),),
            Expanded(child: PanelLeftPage(),),
            Expanded(child: PanelCenterPage(),),
            Expanded(child: PanelRightPage(),),
          ],
        ),
      ),
    );
  }
}
