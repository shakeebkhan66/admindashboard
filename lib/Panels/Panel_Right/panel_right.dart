import 'package:flutter/material.dart';

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,  
      ),
    );
  }
}
