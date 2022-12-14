import 'package:admindashboardflutter/Constants/constant.dart';
import 'package:admindashboardflutter/Layout/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'circle_chart.dart';
import 'curved_chart.dart';

class Todo {
  String? name;
  bool? enable;

  Todo({required this.name, this.enable = true});
}

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final List<Todo> _todo = [
    Todo(name: "Purchase Paper", enable: true),
    Todo(name: "Refill the inventory of speakers", enable: true),
    Todo(name: "Hire Someone", enable: true),
    Todo(name: "Marketing Strategy", enable: true),
    Todo(name: "Selling Furniture", enable: true),
    Todo(name: "Finish the disclosure", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                ),
              ),
            ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
                  ),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      width: double.infinity,
                      child: const ListTile(
                        title: Text(
                          "Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "20% of Products Sold",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Chip(
                          label: Text(
                            "4,500",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // ToDo Graph 1
                const LineChartSample2(),
                // ToDo Graph 2
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Constants.kPadding / 2,
                      right: Constants.kPadding / 2,
                      top: Constants.kPadding / 2,
                      bottom: Constants.kPadding),
                  child: Card(
                    color: Constants.purpleLight,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: List.generate(
                          _todo.length,
                          (index) => CheckboxListTile(
                              title: Text(
                                _todo[index].name.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              value: _todo[index].enable,
                              onChanged: (value) {
                                setState(() {
                                  _todo[index].enable = value ?? true;
                                });
                              })),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
