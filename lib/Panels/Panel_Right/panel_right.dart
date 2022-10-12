import 'package:admindashboardflutter/Panels/Panel_Right/wiggel_chart.dart';
import 'package:flutter/material.dart';

import '../../Constants/constant.dart';


class Product {
  String? name;
  bool? enable;
  Product({required this.name, required this.enable});
}


class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelRightPage> {


  final List<Product> _products = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Bookends", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                left: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text(
                      "Net Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "7% of Sales Avg.",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r"$46,000",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ToDo Graph
            const LineChartSample1(),

            Padding(
              padding: const EdgeInsets.only(
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding,
                top: Constants.kPadding,
                left: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: List.generate(_products.length, (index) => SwitchListTile.adaptive(
                    title: Text(
                     _products[index].name.toString(),
                     style: const TextStyle(color: Colors.white),
                    ),
                      value: _products[index].enable!,
                      onChanged: (value){
                        setState(() {
                          _products[index].enable = value;
                        });
                      }
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
