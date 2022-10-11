import 'package:flutter/material.dart';

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
    );
  }
}